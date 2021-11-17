use strict; use warnings;
###################################
# Time Converter: convert a specific time string to a specific time numeric string
# proof of method
# given a date string -> convert to a different format
###################################
my $x = 'August 15, 2005 4:32 PM';
my $i = solution($x);

print "$i\n LONG LIVE PERL5\n";
###################################
sub solution 
{
    my ($S)=@_;
    my ($mo, $dy, $yr, $tm, $tm_mod);
    my $final;
     ($mo, $dy, $yr, $tm, $tm_mod) = split(' ', $S);

    $final .= "$yr-";
    $final .= month($mo);
    $final .= day($dy);
    $final .= hour($tm, $tm_mod);
    return $final;
}
###################################
sub month
{
	my ($i_mo) = @_;
	my @cal = qw(January February March April May June July August September October November December);
	my $cnt = 0;
	foreach (@cal)
	{
		if ($_ eq $i_mo)
		{
			if ($cnt < 10)
				{return "0$cnt-";} 
			else 
				{return "$cnt-"};
		}
		else 
			{$cnt++; next;}
	}	
}
sub day
{
	my ($i_dy) = @_;
	$i_dy =~ s%,%%;
	if ($i_dy < 10)
		{ return "0$i_dy ";}
	return "$i_dy ";

}
sub hour
{
	my ($i_tm, $i_tm_mod) = @_;
	if ($i_tm_mod eq "AM")
	{ 
		if ($i_tm < 10)
			{ return "0$i_tm"; }
		else 
			{ return "$i_tm"; }
	}
	else 
	{ 
		my @i_tm = split(":", $i_tm);
		$i_tm[0] += 12;
		return "$i_tm[0]:$i_tm[1]";
	}
}
