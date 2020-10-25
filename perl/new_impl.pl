#!/usr/bin/perl -w



#sub get_dirs
#{
#	my $path=$_[0];
#	my $handle = "";
#	my $first = "\n<repo>\n<a href=\"http://linux.net/gl-cgi-bin/gitweb-gl-slp-";
#	my $initial = ".cgi?p=";
#	my $last = ";a=summary";
#	my @retval=();
#	my @tokens=();
#	my $type="1";
#
#	opendir($handle, $path) || die("Cannot open directory");
#	my @dirlisting = readdir($handle);
#	closedir($handle);
#
#	foreach $f (@dirlisting)
#	{
#		unless ( ($f eq ".") || ($f eq "..") || ($f eq "llvm" ) )
#		{
#			if ( -d $path."/".$f )
#			{
#				if ( $f=~/^.+(\.git)$/i )
#				{
#					@tokens = split(/\//,$path);
#					$middle = pop @tokens;
#					$full_name = $first.$middle.$initial.$path."/".$f.$last."\">\n".$f."\n</a>\n</repo>\n";
#					$type="2";
#				}
#				else
#				{
#					$full_name = "\n<dir name=\"".$f."\">\n</dir>";
#					$type="1";
#				}
#				push(@retval, $full_name);
#			}
#		}
#	}
#	return ($type, @retval);
#}

#my ($kind, @finalist)=get_dirs $ARGV[0];

my $first = "<li><span class=\"folder\"><a href=\"http://linux.net/gl-cgi-bin/gitweb-gl-slp-";
my $initial = ".cgi?p=";
my $last = ";a=summary";
my @tokens=();
my $prevdir = "";
my $currdir = "";
my $offset=2;

@dirlist=`find $ARGV[0] -ignore_readdir_race -type d -name "*.git" -prune | | sort | grep -v llvm`;
sort(@dirlist);
print '<body><div id="main"><ul id="browser" class="filetree treeview-famfamfam">';
print '<ul>'
foreach $element (@dirlist)
{
	$repo = substr ($element, index($element, "/", $offset));
	@tokens = split(/\//,$element);
	$currdir = substr ($element rindex($element, "/"));

	foreach $dir (@tokens)
	{
		if ( $currdir eq $prevdir )
		{
		}
		else
		{
			print '<ul>';
			print '<li><span class="folder">'.$currdir.'</span>';
		}
	}
	else
	{
	}
	
						<li><span class="file"><a href="http://www.google.com">Item 1.1.1</a></span></li>
					</ul>
				</li>
				<li><span class="folder">Folder 2</span>
					<ul>
						<li><span class="folder">Subfolder 2.1</span>
							<ul>
								<li><span class="file">File 2.1.1</span></li>
								<li><span class="file">File 2.1.2</span></li>
							</ul>
						</li>
						<li><span class="folder">Subfolder 2.2</span>
							<ul>
								<li><span class="file">File 2.2.1</span></li>
								<li><span class="file">File 2.2.2</span></li>
							</ul>
						</li>
					</ul>
				</li>
				<li class="closed"><span class="folder">Folder 3 (closed at start)</span>
					<ul>
						<li><span class="file">File 3.1</span></li>
					</ul>
				</li>
				<li><span class="file">File 4</span></li>
			</ul>
		</li>
	</ul>
</div>
</body>
</html>';
	print "\n";
