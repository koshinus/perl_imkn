package Matrix;

#use warnings;
use strict;
use overload '*' => \&mult;

sub new
{
	my $class = shift;
	my $matr = shift;
	my @matrix = @$matr;
	my $col_num = @matrix;
	my $row_num = @{$matrix[0]};
	for(my $i = 0; $i < $row_num; $i++)
	{
		if(@{$matrix[$i]} != $row_num)
		{
			die "Matrix lines have different size!";
		}
	}
	my $self =  
		{
			name 		=> 'Matrix',
			column_num 	=> $col_num,
			row_num 	=> $row_num,
			data 		=> $matr
		};
	return bless($self, $class);
}

sub to_string
{
	my $self = shift;
	my @matr = @{$self->{data}};
	my $str = "";
	foreach my $line (@matr)
	{
		foreach my $elem (@$line)
		{
			$str.="$elem ";
		}
		$str.="\n";
	}
	return $str;
}

sub mult
{
	my ($obj1, $obj2) = @_;
	my @obj3_data = ();
	my @obj3_row = ();
	if($obj1->{row_num} != $obj2->{column_num})
	{
		die "We can't multiple this matrices!"
	}
	our @obj1_data = @{$obj1->{data}};
	our @obj2_data = @{$obj2->{data}};
	foreach my $row (0..$obj1->{column_num}-1)
	{
		foreach my $column (0..$obj2->{row_num}-1)
		{
			push (@obj3_row, 0);
		}
		push(@obj3_data, @obj3_row);
	}
	for (my $i = 0; $i < $obj1->{column_num}; $i++)
	{
		for (my $j = 0; $j < $obj1->{row_num}; $j++)
		{
			for (my $k = 0; $k < $obj2->{column_num}; $k++)
			{
				$obj3_data[$i][$j] += ($obj1_data[$i][$k]*$obj2_data[$k][$j]);
			}
		}
	}
	my $obj3 = Matrix->new(\@obj3_data);
	return $obj3;
}

1;
__END__
				#cArr[i][j] += (aArr[i][k] * bArr[k][j]);

			#foreach my $k (0..$obj2->{column_num}-1)
			#for my $k (0..$obj2->{column_num}-1)
			
		#foreach my $j (0..$obj1->{row_num}-1)
		#for my $j (0..$obj1->{column_num}-1)
		
	#foreach my $i (0..$obj1->{column_num}-1)
	#for my $i (0..$obj1->{column_num}-1)