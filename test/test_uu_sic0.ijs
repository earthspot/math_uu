smoutput(jpathsep>(4!:4<'zx'){4!:3'');~zx=.'test uu with SIC=0'
cocurrent 'uu'
'SIC SIG SIZ'=: 0 3 __
Q=: 3 : 'q1234__=: y'
A=: 3 : 'assert. y-:q1234__ [qqq__=: y;q1234__'
	NB. FROM HERE ON, temps 100 101 102 103 INPUTS are identical
Q 0 pick 'degF' convert 'degC'
A 'degF'
Q (0j2&":) ; }. 'degF' convert 'degC'
A '17.78 1.80'
	NB. ----------------------
Q uu '100 degC'
A '373.150 K'
Q uu '212 degF'
A '373.150 K'
Q 'degC' uu '100 degC'
A '100 degC'
Q 'degF' uu '100 degC'
A '212.000 degF'
Q 'degC' 	uu '212 degF'
A '100.000 degC'
Q 'degC' 	uu '373.15 K'
A '100 degC'
Q 'degF' 	uu '373.15 K'
A '212.000 degF'
Q 'Fahrenheit' uu '373.15 K'
A '212.000 Fahrenheit'
Q 'Centigrade' uu '373.15 K'
A '100 Centigrade'
Q 'Celsius' uu '373.15 K'
A '100 Celsius'
	NB. ----------------------
Q uu '1 Ohm'
A '1 kg m^2/A^2/s^3'
Q 'Ω' uu '6 kg m²/A²/s³'
A '6 Ohm'
Q 'Ohm' uu '6 kg m²/A²/s³'
A '6 Ohm'
Q 'Ω' uu '6 kg m^2/A^2/s^3'
A '6 Ohm'
Q 'Ohm' uu '6 kg m^2/A^2/s^3'
A '6 Ohm'
Q uu '6 kg m²/A²/s³'
A '6 kg m^2/A^2/s^3'
Q uu '6 kg m^2/A^2/s^3'
A '6 kg m^2/A^2/s^3'
	NB. ----------------------
Q uu '1 s'
A '1 s'
Q 'h' uu '1 d'
A '24 h'
Q uu '1 d'
A '86400 s'
Q uu '1 /d'
A '1.157E-5 /s'
Q 'Hz' uu '1 /d'
A '1.157E-5 Hz'
Q 'note' uu '1 /d'
A 'G note'
Q 'note' uu '440 Hz'	NB. A440 pitch standard
A 'A note'
Q 'note' uu '194.18 Hz'	NB. G (earth-rotation musical note)
A 'G note'
