#!/usr/bin/perl -w
#
# Create a user agent object
use LWP::UserAgent;
use HTML::TreeBuilder::XPath;
use LWP::Simple;
use LWP::Parallel::UserAgent;
use Getopt::Long qw( GetOptions );


$hash{ 'indianfemales' } = 'http://www.santabanta.com/wallpapers/indian-celebrities(f)/8/?order=h';
$hash{ 'globalfemales' } = 'http://www.santabanta.com/wallpapers/global-celebrities(f)/8/?order=h';
$hash{ 'babes' }         = 'http://www.santabanta.com/wallpapers/babes/28/';
$hash{ 'miscbabes' }     = 'http://www.santabanta.com/wallpapers/miscellaneous-babes/';
$hash{ 'beach-babes' }    = 'http://www.santabanta.com/wallpapers/beach-babes/';
$hash{ 'lingerie' }      = 'http://www.santabanta.com/wallpapers/lingerie/';
$hash{ 'bikini' }        = 'http://www.santabanta.com/wallpapers/bikini/';
$hash{ 'negligee' }      = 'http://www.santabanta.com/wallpapers/negligee/';
$hash{ 'flowers' }       = 'http://www.santabanta.com/wallpapers/flowers/32/';
$hash{ 'indianfemales' } = 'http://www.santabanta.com/wallpapers/indian-celebrities(f)/2/';
$hash{ 'birds' }         = 'http://www.santabanta.com/wallpapers/birds/';
$hash{ 'animals' }         = 'http://www.santabanta.com/wallpapers/animals/29/';
$hash{ 'butterfly' }         = 'http://www.santabanta.com/wallpapers/butterfly/';
$hash{ 'aquatic' }         = 'http://www.santabanta.com/wallpapers/aquatic/';
$hash{ 'angelina-jolie' } = 'http://www.santabanta.com/wallpapers/angelina-jolie/';
$hash{ 'all' } = 'http://www.santabanta.com/wallpapers/all-categories/0/?order=h';
$hash{ 'katy-perry'} = 'http://www.santabanta.com/wallpapers/katy-perry/';
$hash{ 'goddessdurga'} = 'http://www.santabanta.com/wallpapers/goddess-durga/';
$hash{ 'hinduism'} = 'http://www.santabanta.com/wallpapers/goddess-durga/';
$hash{ 'lord-ganesha'} = 'http://www.santabanta.com/wallpapers/lord-ganesha/';

my $index=0;

if ($#ARGV != 0) {
    print "usage: $0 <option> where option is\n";
    foreach my $key ( keys %hash )
    {
        print "$key\n";
        $index ++;
    }
    exit;
}


# Create a request
my $ua = LWP::UserAgent->new;
$ua->agent("MyDesktop/0.1 ");
my $req = HTTP::Request->new(GET => $hash{$ARGV[0]});
my @reqs; 
my @reps; 

print "Getting ", $#ARGV, " = ", $hash{$ARGV[0]}, "\n";

# Pass request to the user agent and get a response back
my $res = $ua->request($req);

# Check the outcome of the response
if ($res->is_success) {
	#print $res->content;
    my $root = HTML::TreeBuilder->new_from_content($res->content);
    my @arr1;
    foreach my $tag ($root->findnodes( '//a[./img]')) {
		print "link: ", $tag->as_HTML , "\n";
        push @arr1, $tag->as_HTML;
    }

    @foo = grep(/$ARGV[0]/, @arr1); 
    my $picpath = "/home/sanjeev/Pics/";

    foreach (@foo) {
        @tokens = split(/"/, $_);
        @matches = grep(/jpg/, @tokens); 
        foreach (@matches) {
			print "$_\n";
            my $pic = $_;
            $pic =~ s/medium1/full5/g;
            $pic =~ s/media/media1/g;
            $pic =~ s/\/$ARGV[0]\//\/\u\L$ARGV[0]\//g;
            my $save = $picpath.$index."\.jpg";
            push (@reqs, HTTP::Request->new('GET', $pic));
            push (@resp, $save);
			print "Saved ", $pic, " to $save\n";
            $index ++;
        }
    }
    my $pua = LWP::Parallel::UserAgent->new();
    $pua->in_order  (1);  # handle requests in order of registration
    $pua->duplicates(0);  # ignore duplicates
    $pua->timeout   (5);  # in seconds
    $pua->redirect  (1);  # follow redirects

    foreach my $r (@reqs) {
	print "Registering '".$r->url."'\n";
        if ( my $res = $pua->register($r) ) { 
            print STDERR $res->error_as_HTML; 
        }  
    }
    my $entries = $pua->wait();

    $index = 0;
    foreach (keys %$entries) {
        my $res = $entries->{$_}->response;
        open(my $fh, ">", $resp[$index]);
	print $fh $res->content;
        close $fh;
        $index ++;
    }
}
else {
    print $res->status_line, "\n";
}
system("DISPLAY=:0.0 xfdesktop --reload");
