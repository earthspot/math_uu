smoutput(jpathsep>(4!:4<'zx'){4!:3'');~zx=.'uu test3 component test'
cocurrent 'uu'
'SIC SIG SIZ'=: 0 3 1e_17
Q=: 3 : 'q1234__=: y'
A=: 3 : 'assert. y-:q1234__ [qq=: y;q1234__'

SIC=: 0	NB. no unicode in units
Q uu '3 ft'
A '0.914 m'
Q uu '1 yd'
A '0.914 m'
Q uu '1 min'
A '60 s'
Q 'ft' uu '1 yd'
A '3 ft'
Q 'yd' uu '6 ft'
A '2 yd'
Q 'km' uu '56789 m'
A '56.789 km'

SIC=: 0	NB. no unicode in units
Q uu '15 Ang/s/s'
A '1.500E-9 m/s^2'
Q 'Ang' uu '1 mm'
A '10000000 Ang'
Q 'Ang/s^2' uu '0.0001 ft/s/s'
A '304800 Ang/s^2'

Q 'ft/s^2' uu '1 Å h⁻²'
A '2.532E-17 ft/s^2'
Q 'ft/s^2' uu '1 Å/h^2'
A '2.532E-17 ft/s^2'
Q 'ft/s^2' uu '1 Å/h/h'
A '2.532E-17 ft/s^2'
Q 'ft/s^2' uu '1 Ang/h/h'
A '2.532E-17 ft/s^2'

SIC=: 1	NB. unicoded with slashes
Q uu '15 Ang/s/s'
A '1.500E-9 m/s²'
Q 'Ang' uu '1 mm'
A '10000000 Å'
Q 'Ang/s^2' uu '0.0001 ft/s/s'
A '304800 Å/s²'
z=: '2.532E-17 ft/s²'
Q 'ft/s^2' uu '1 Å h⁻²'
Q 'ft/s^2' uu '1 Å/h^2'
Q 'ft/s^2' uu '1 Å/h/h'
Q 'ft/s^2' uu '1 Ang/h/h'

SIC=: 2	NB. unicoded with negative powers
Q uu '15 Ang/s/s'
A '1.500E-9 m s⁻²'
Q 'Ang' uu '1 mm'
A '10000000 Å'
Q 'Ang/s^2' uu '0.0001 ft/s/s'
A '304800 Å s⁻²'
Q 'ft/s^2' uu '1 Å h⁻²'
A '2.532E-17 ft s⁻²'
Q 'ft/s^2' uu '1 Å/h^2'
A '2.532E-17 ft s⁻²'
Q 'ft/s^2' uu '1 Å/h/h'
A '2.532E-17 ft s⁻²'
Q 'ft/s^2' uu '1 Ang/h/h'
A '2.532E-17 ft s⁻²'

SIC=: 3	NB. unicoded like SIC=2 but dotted
Q uu '15 Ang/s/s'
A '1.500E-9 m·s⁻²'
Q 'Ang' uu '1 mm'
A '10000000 Å'
Q 'Ang/s^2' uu '0.0001 ft/s/s'
A '304800 Å·s⁻²'
Q 'ft/s^2' uu '1 Å·h⁻²'
A '2.532E-17 ft·s⁻²'
Q 'ft/s^2' uu '1 Å/h^2'
A '2.532E-17 ft·s⁻²'
Q 'ft/s^2' uu '1 Å/h/h'
A '2.532E-17 ft·s⁻²'
Q 'ft/s^2' uu '1 Ang/h/h'
A '2.532E-17 ft·s⁻²'