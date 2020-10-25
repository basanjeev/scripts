#!/usr/bin/perl -w

@result = `find $ARGV[0] -type d prune`;


sub get_dirs
{
	my $path=$_[0];
	my $handle = "";
	my $first = "\n<repo>\n<a href=\"http://linux.net/gl-cgi-bin/gitweb-gl-slp-";
	my $initial = ".cgi?p=";
	my $last = ";a=summary";
	my @retval=();
	my @tokens=();
	my $type="1";

	opendir($handle, $path) || die("Cannot open directory");
	my @dirlisting = readdir($handle);
	closedir($handle);

	foreach $f (@dirlisting)
	{
		unless ( ($f eq ".") || ($f eq "..") || ($f eq "llvm" ) )
		{
			if ( -d $path."/".$f )
			{
				if ( $f=~/^.+(\.git)$/i )
				{
					@tokens = split(/\//,$path);
					$middle = pop @tokens;
					$full_name = $first.$middle.$initial.$path."/".$f.$last."\">\n".$f."\n</a>\n</repo>\n";
					$type="2";
				}
				else
				{
					$full_name = "\n<dir name=\"".$f."\">\n</dir>";
					$type="1";
				}
				push(@retval, $full_name);
			}
		}
	}
	return ($type, @retval);
}

my ($kind, @finalist)=get_dirs $ARGV[0];

foreach $element (@finalist)
{
	if ( $kind eq "1" )
	{
		print "\n<dir name=\"".$f."\">\n"

		print "</dir>";
	}
	else
	{
		print $element;
	}
}
<body>
<div id="main">
	<ul id="browser" class="filetree treeview-famfamfam">
		<li><span class="folder">Folder 1</span>
			<ul>
				<li><span class="folder">Item 1.1</span>
					<ul>
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
</html>
