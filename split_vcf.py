fname = raw_input('name of file: ')
 
fopen = open(fname, 'r')
 
begincard = 'BEGIN:VCARD'
endcard = 'END:VCARD'
i = 0
cutline = 'ggghtekgqp'
while not cutline == '':
	if cutline[0:11] == begincard:
		i=i+1
		filnam='%i.vcf'%(i)
		testopen = open(filnam, 'w')
		while not cutline[0:9] == endcard:
			testopen.write(cutline)
			cutline = fopen.readline()
         
		if cutline[0:9] == endcard:
			testopen.write('END:VCARD')
			testopen.close()
	cutline = fopen.readline()
