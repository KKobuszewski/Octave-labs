f = @(x) exp(-x.^2).*(4*sin(x).+1)
e=1e-7;

x0=bisect(f,-2,2,e);

X = linspace(-2.01,2.01,10000);
plot(X,f(X),x0,f(x0),"or")%zeros(1,length(x0)),"or")
title("Ciag kolejnych przyblizen miejsca zerowego metoda bisekcji");
grid on
xlabel("x");
ylabel("y");

printf("Dokladnosc %e\n",e);
printf("Tablica z kolejnymi przyblizeniami miejsca zerowego:\n");
format long e;
x0
printf("\n\n\n\nnajlepsze przyblizenie rozwiazania: %e\n\n\n",x0(end));
printf("Roznica pomiedzy rozwiazaniem dokladnym asin(0.25) [1], a  wyznoczonym przez bisekcje %e\n", abs(x0(end)+asin(0.25)))
printf("[1] http://www.wolframalpha.com/")

