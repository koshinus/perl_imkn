package Matrix;

use warnings;
use strict;
use overload '*' => \&mult;

sub new
{
	my $class = shift;
	my @matrix = @_;
	my $col_num = $#matrix+1;
	my $row_num = $#{$matrix[0]}+1;
	foreach my $i (0..$col_num-1)
	{
		if($#{$matrix[$i]} != $row_num-1)
		{
			die "Matrix lines have different size!";
		}
	}
	my $self =  
		{
			name 		=> 'Matrix',
			column_num 	=> $col_num,
			row_num 	=> $row_num,
			data 		=> @matrix
		};
	return bless($self, $class);
}

sub to_string
{
	my $obj = shift;
	my @matr = $obj->{data};
	my $str = "";
	foreach my $line (@matr)
	{
		foreach my $elem (@$line)
		{
			$str."$elem ";
		}
		$str."\n";
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
	my @obj1_data = $obj1->{data};
	my @obj2_data = $obj2->{data};
	foreach my $row (0..$obj1->{column_num}-1)
	{
		foreach my $column (0..$obj2->{row_num}-1)
		{
			push (@obj3_row, 0);
		}
		push(@obj3_data, @obj3_row);
	}
	foreach my $i (0..$obj1->{column_num}-1)
	{
		foreach my $j (0..$obj1->{row_num}-1)
		{
			foreach my $k (0..$obj2->{column_num}-1)
			{
				#cArr[i][j] += (aArr[i][k] * bArr[k][j]);
				$obj3_data[$i][$j] += ($obj1_data[$i][$k]*$obj2_data[$k][$j]);
			}
		}
	}
	my $obj3 = Matrix->new(data => @obj3_data);
	return $obj3;
}

1;
