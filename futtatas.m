fprintf("A függvény eredménye %d helyen: %1.6f\n", 5, fgv1(5))
fgv1(5)

%% ------------- Ábrázolás ------------------

%% 1. eset plot
x = -5:0.01:5;
y = fgv1(x);
plot(x,y)

%% 2. eset fplot
%@ kell ha külső fájlból hivunk
fplot(@fgv1)
ax = gca();
ax.XAxisLocation = "origin";
ax.YAxisLocation = "origin";
ax.XLim = [-10, 10];
ax.YLim = [-1, 20];
ax.NextPlot = "add";


%% 3. eset függvényt, változóként definiálunk

syms x; %matematikai értekembe vett változó
f(x) = atan(exp(x) - 2);
fplot(f)

%% ---- Fixpont iteráció -----

fixpont(@fgv1, 10^-4)

%ellenőrizzük az eredményt ami 54
x = -5:0.01:55;
y = fgv1(x);
plot(x,y, x, x)
ax = gca();
ax.XAxisLocation = "origin";
ax.YAxisLocation = "origin";
ax.XLim = [-10, 10];
ax.YLim = [-1, 20];
ax.NextPlot = "add";
disp("A fixpont 21 lépés után: 54.59801")


%% változó függvényel

fixpont(f, 10^-4)
x = -5:0.01:5;
y = f(x);
plot(x,y, x, x)
ax = gca();
ax.XAxisLocation = "origin";
ax.YAxisLocation = "origin";
ax.XLim = [-10, 10];
ax.YLim = [-1, 20];
ax.NextPlot = "add";
disp("A fixpont 7 lépés után: -1.0233")


%% fixpont iteráció egyenletek megoldására
%% atan(exp(x) - 2) = x^3

%van a metszés pontja a jobb és bal oldalnak?
syms x;
f(x) = atan(exp(x) - 2);
g(x) = x^3;

ax = gca();
ax.XAxisLocation = "origin";
ax.YAxisLocation = "origin";
ax.XLim = [-5, 5];
ax.YLim = [-1, 10];
ax.NextPlot = "add";

fplot(f)
fplot(g)


fixfg(x) = nthroot(f(x),3);
fixpont(fixfg, 10^-4)

fixfg2(x) = log(tan(x^3)+2); %lassu
fixpont(fixfg2, 10^-4)

fixpont(@fixfgv, 10^-4) %% a logaritmus miatt valahol negítiv értéket vesz fel

%% ---- ITERÁCIÓK -----

% intervallum felező módszer, menteni az ábrázolást

syms x;
f(x) = 4*sin(exp(x));
g(x) = -log(x) + 3;

ax = gca();
ax.XAxisLocation = "origin";
ax.YAxisLocation = "origin";
ax.XLim = [-1, 3];
ax.YLim = [-5, 5];
ax.NextPlot = "add";

fplot(f)
fplot(g)

intfel(f-g,0,0.5,10^-4) % ha nagyon lelaussul az f-g ki kell tenni egy külön fájlba

% húrmódszer
hur(@iterfg, 0.5, 1.5, 10^-4)


% newton módszer

df(x) = diff(f-g);
newton(f-g, df, 10^-4)

% szelőmódszer

szelo(@iterfg, 10^-4)

%% ---- ELIMINÁCIÓ ------

A = [3,1,2,-3; 
    2,0,3,-3;
    1,1,1,0;
    1,-4,1,3;]

b = [-2, -4, 0, 3]'; % ' a transzponálás, h oszlop vektor legyen. vagy ;-vel választom el az elemeket

gauss(A,b)


rgauss(A,b)

tgauss(A,b)

%% ------ INTERPOLÁCIÓ -------

% Lagrange interpoláció

x = [-2;-1;0;1;2];
y = [96;21;6;3;12];
LagrIntV(x,y)

syms z;
fg(z) = 6-5*z+4*z^2-4*z^3+2*z^4;

x1 = -5:0.001:5;
y1 = fg(x1);

ax = gca();
ax.XAxisLocation = "origin";
ax.YAxisLocation = "origin";
ax.XLim = [-5, 5];
ax.YLim = [-2, 99];
ax.NextPlot = "add";

plot(x1, y1, x,y, '*') %  képet menteni kell jpg-be

% Newton féle Lagrange polinom
x = [-1;-0;1;2];
y = [21;6;3;12];
NewtIntp(x,y)


syms z;
fg(z) = 21-15*(z+1)+6*(z+1)*(z-0)+0*(z+1)*(z-0)*(z-1);

x1 = -5:0.001:5;
y1 = fg(x1);

ax = gca();
ax.XAxisLocation = "origin";
ax.YAxisLocation = "origin";
ax.XLim = [-5, 5];
ax.YLim = [-2, 25];
ax.NextPlot = "add";


plot(x1, y1, x,y, '*') %  képet menteni kell jpg-be

%% --------- INTEGRÁLÁS --------------

% trapéz szabály

syms x;
f(x) = 4*sin(exp(x));

trapez(f, 0, 4) %alapból 50 részre osztjuk

simpson(f, 0, 4) % ha 50 részre osztjuk, akkor 25x alkalmazzuk



% a két görbe közötti terület meghatározása
f(x) = -x^4+4*x+7;
g(x) = log(x+2);

ax = gca();
ax.XAxisLocation = "origin";
ax.YAxisLocation = "origin";
ax.XLim = [-5, 5];
ax.YLim = [-5, 10];
ax.NextPlot = "add";

fplot(f)
fplot(g)

intfel(f-g, -1.5, 0, 10^-4)
a = -1.235138
intfel(f-g, 1, 3, 10^-4)
b = 1.908630

trapez(f-g, a, b)
simpson(f-g, a, b)
