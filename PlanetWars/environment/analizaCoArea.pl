#!/usr/bin/perl



my $turno;
my @p1_planets; my @p1_ships; my  $p1_proc = 0;
my @p2_planets; my @p2_ships; my  $p2_proc = 0;
my @p3_planets; my @p3_ships; my  $p3_proc = 0;
my @p4_planets; my @p4_ships; my  $p4_proc = 0;
my $leer = 4;

open (LOG, '>>log_analizador.txt'); 

while ($linea=<>){
		chop($linea);
	if ($linea=~/Turn ([^ \n]*)/){
		$turno = $1;
		$leer = 4;

		$p1_proc = 0; $p2_proc = 0; $p3_proc = 0; $p4_proc = 0;
	
	#                           $1         $2            $3       $4    $5     $6     $7
	}elsif($linea=~/Player (1|2|3|4): P(1|2|3|4) - (true|false)-(\d*)\/(\d*)-(\d*)\/(\d*)/){
		if($1 == "1"){
			if($2 == "1"){
				#Hablamos del jugador 1
				if(!$p1_proc){
					push(@p1_planets,$5>0?$4/$5:0);
					push(@p1_ships, $7>0?$6/$7:0);
					$p1_proc = 1;
				}
			}elsif($2 == "2"){
				#Hablamos del jugador 2
				if(!$p2_proc){
					push(@p2_planets,$5>0?$4/$5:0);
					push(@p2_ships, $7>0?$6/$7:0);
					$p2_proc = 1;
				}

			}elsif($2 == "3"){
				#Hablamos del jugador 3
				if(!$p3_proc){
					push(@p3_planets,$5>0?$4/$5:0);
					push(@p3_ships, $7>0?$6/$7:0);
					$p3_proc = 1;
				}

			}elsif($2 == "4"){
				#Hablamos del jugador 4
				if(!$p4_proc){
					push(@p4_planets,$5>0?$4/$5:0);
					push(@p4_ships, $7>0?$6/$7:0);
					$p4_proc = 1;
				}				

			}
		}elsif($1 == "2"){
			if($2 == "1"){
				#Hablamos del jugador 2
				if(!$p2_proc){
					push(@p2_planets,$5>0?$4/$5:0);
					push(@p2_ships, $7>0?$6/$7:0);
					$p2_proc = 1;
				}
			}elsif($2 == "2"){
				#Hablamos del jugador 1
				if(!$p1_proc){
					push(@p1_planets,$5>0?$4/$5:0);
					push(@p1_ships, $7>0?$6/$7:0);
					$p1_proc = 1;
				}

			}elsif($2 == "3"){
				#Hablamos del jugador 3
				if(!$p3_proc){
					push(@p3_planets,$5>0?$4/$5:0);
					push(@p3_ships, $7>0?$6/$7:0);
					$p3_proc = 1;
				}

			}elsif($2 == "4"){
				#Hablamos del jugador 4
				if(!$p4_proc){
					push(@p4_planets,$5>0?$4/$5:0);
					push(@p4_ships, $7>0?$6/$7:0);
					$p4_proc = 1;
				}				

			}

		}elsif($1 == "3"){
			if($2 == "1"){
				#Hablamos del jugador 3
				if(!$p3_proc){
					push(@p3_planets,$5>0?$4/$5:0);
					push(@p3_ships, $7>0?$6/$7:0);
					$p3_proc = 1;
				}
			}elsif($2 == "2"){
				#Hablamos del jugador 2
				if(!$p2_proc){
					push(@p2_planets,$5>0?$4/$5:0);
					push(@p2_ships, $7>0?$6/$7:0);
					$p2_proc = 1;
				}

			}elsif($2 == "3"){
				#Hablamos del jugador 1
				if(!$p1_proc){
					push(@p1_planets,$5>0?$4/$5:0);
					push(@p1_ships, $7>0?$6/$7:0);
					$p1_proc = 1;
				}

			}elsif($2 == "4"){
				#Hablamos del jugador 4
				if(!$p4_proc){
					push(@p4_planets,$5>0?$4/$5:0);
					push(@p4_ships, $7>0?$6/$7:0);
					$p4_proc = 1;
				}				

			}

		}elsif($1 == "4"){
			if($2 == "1"){
				#Hablamos del jugador 4
				if(!$p4_proc){
					push(@p4_planets,$5>0?$4/$5:0);
					push(@p4_ships, $7>0?$6/$7:0);
					$p4_proc = 1;
				}
			}elsif($2 == "2"){
				#Hablamos del jugador 2
				if(!$p2_proc){
					push(@p2_planets,$5>0?$4/$5:0);
					push(@p2_ships, $7>0?$6/$7:0);
					$p2_proc = 1;
				}

			}elsif($2 == "3"){
				#Hablamos del jugador 3
				if(!$p3_proc){
					push(@p3_planets,$5>0?$4/$5:0);
					push(@p3_ships, $7>0?$6/$7:0);
					$p3_proc = 1;
				}

			}elsif($2 == "4"){
				#Hablamos del jugador 1
				if(!$p1_proc){
					push(@p1_planets,$5>0?$4/$5:0);
					push(@p1_ships, $7>0?$6/$7:0);
					$p1_proc = 1;
				}				
			}
		}
	}
}

my $p1_ships_area = 0.0;
my $p2_ships_area = 0.0;
my $p3_ships_area = 0.0;
my $p4_ships_area = 0.0;

print LOG "Turnos;P1;P2;P3;P4";
for($i = 1; $i< $turno; $i++ ){
	print LOG $i . ";". $p1_ships[$i] .";". $p2_ships[$i] .";". $p3_ships[$i] .";". $p4_ships[$i] ."\r\n";

	$p1_ships_area = $p1_ships_area + $p1_ships[$i];
	$p2_ships_area = $p2_ships_area + $p2_ships[$i];
	$p3_ships_area = $p3_ships_area + $p3_ships[$i];
	$p4_ships_area = $p4_ships_area + $p4_ships[$i];

}

print " P1\n";
print $p1_ships_area/$turno;
print "\n";

print " P2\n";
print $p2_ships_area/$turno;
print "\n";

print " P3\n";
print $p3_ships_area/$turno;
print "\n";

print " P4\n";
print $p4_ships_area/$turno;
print "\n";


print LOG "P1\t". $p1_ships_area/$turno . "\t" . $p1_ships_area."\r\n";
print LOG "P2\t". $p2_ships_area/$turno . "\t" . $p2_ships_area."\r\n";
print LOG "P3\t". $p3_ships_area/$turno . "\t" . $p3_ships_area."\r\n";
print LOG "P4\t". $p4_ships_area/$turno . "\t" . $p4_ships_area."\r\n";