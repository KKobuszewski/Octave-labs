a = ones(5,20);
b = ones(5,20).*3;
c = [a;b]
c(6:8,12:15) = 25
c(:,[15,16,17]) = c(:,[15,16,17]).*c(:,[15,16,17]);
c