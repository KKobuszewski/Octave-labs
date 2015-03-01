sum = 0;
i = 0;
while i < 100
	i = i + 1;
	if mod(i,2) == 1
		sum = sum + i;
	end
end
printf("Suma 1iczb nieparzystych od 0 do 100: %i\n",sum)
sum