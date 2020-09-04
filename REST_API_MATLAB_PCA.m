% Aron Witkowski - Praca magisterska
% Podprogram 1
% Nale¿y pamiêtaæ o ograniczeniu chmury - maksymalnie 5 zapytañ na minutê!

%% Zapytanie o token (POST Token)

URL1 = 'https://api.climatixic.com/Token';
API_key = '9dbeeb6183f54595b67c71e8a0473606';
first_options = weboptions('MediaType','application/x-www-form-urlencoded','contenttype',...
    'json','RequestMethod','post','KeyName','Ocp-Apim-Subscription-Key','KeyValue',API_key);
body = 'grant_type=password&username=nazwa_uzytkownika&password=has³o_do_portalu_ClimatixIC&expire_minutes=20160';
response = webwrite(URL1,body,first_options);

Token = response.access_token

%% Zapytanie o instalacje (GET Plants)

URL2 = 'https://api.climatixic.com/Plants';
headerFields2 = {'Authorization', ['Bearer ', Token]};
options2 = weboptions('HeaderFields', headerFields2,'ContentType','json',...
    'MediaType','application/x-www-form-urlencoded','KeyName','Ocp-Apim-Subscription-Key','KeyValue',API_key);
response2 = webread(URL2,options2);

%% Zapytanie o punkty danych instalacji (GET Data Points)
api3 = 'https://api.climatixic.com/DataPoints';
tail3 = '/?parentId=[{"Plants": "P7ac8f2a3-7069-484c-b745-dca3ce11bb92"}]&tenantId=T9200bf1c-3e9e-4483-a225-534dc85da2bf&take=100';
URL3 = [api3 tail3];
headerFields3 = {'Authorization', ['Bearer ', Token]};
options3 = weboptions('HeaderFields', headerFields3,'ContentType','json',...
    'MediaType','application/x-www-form-urlencoded','KeyName','Ocp-Apim-Subscription-Key','KeyValue',API_key);
response3 = webread(URL3,options3);


%% Temperatura na zasilaniu CO (CO Zas) czêœæ 1

api_dp = 'https://api.climatixic.com/DataPoints';
tail4 = '/P7ac8f2a3-7069-484c-b745-dca3ce11bb92;1!N3ASTGVEMGK16Y7/History?start=1526324318000&end=1842548318000&take=100';
URL4 = [api_dp tail4];
headerFields4 = {'Authorization', ['Bearer ', Token]};
options4 = weboptions('HeaderFields', headerFields4,'ContentType','json','MediaType',...
    'application/x-www-form-urlencoded','KeyName','Ocp-Apim-Subscription-Key','KeyValue',API_key)
response4 = webread(URL4,options4)

vector4 = struct2cell(response4.values.values.P7ac8f2a3_7069_484c_b745_dca3ce11bb92_1_N3ASTGVEMGK16Y7);
vector4([1,2,3],:) = [];
size(vector4)

%% Temperatura na zasilaniu CO (CO Zas) czêœæ 2

tail4_2 = '/P7ac8f2a3-7069-484c-b745-dca3ce11bb92;1!N3ASTGVEMGK16Y7/History?start=1526324318000&end=1842548318000&take=100&skip=100';
URL4_2 = [api_dp tail4_2];
headerFields4_2 = {'Authorization', ['Bearer ', Token]};
options4_2 = weboptions('HeaderFields', headerFields4_2,'ContentType','json','MediaType',...
    'application/x-www-form-urlencoded','KeyName','Ocp-Apim-Subscription-Key','KeyValue',API_key)
response4_2 = webread(URL4_2,options4_2)

vector4_2 = struct2cell(response4_2.values.values.P7ac8f2a3_7069_484c_b745_dca3ce11bb92_1_N3ASTGVEMGK16Y7);
vector4_2([1,2,3],:) = [];
size(vector4_2)

%% Temperatura na zasilaniu CO (CO Zas) czêœæ 3

tail4_3 = '/P7ac8f2a3-7069-484c-b745-dca3ce11bb92;1!N3ASTGVEMGK16Y7/History?start=1525719518000&end=1526324318000&take=100';
URL4_3 = [api_dp tail4_3];
headerFields4_3 = {'Authorization', ['Bearer ', Token]};
options4_3 = weboptions('HeaderFields', headerFields4_3,'ContentType','json','MediaType',...
    'application/x-www-form-urlencoded','KeyName','Ocp-Apim-Subscription-Key','KeyValue',API_key)
response4_3 = webread(URL4_3,options4_3)

vector4_3 = struct2cell(response4_3.values.values.P7ac8f2a3_7069_484c_b745_dca3ce11bb92_1_N3ASTGVEMGK16Y7);
vector4_3([1,2,3],:) = [];
size(vector4_3)
vector4sum2 = [vector4 vector4_2];
vector4sum3 = [vector4 vector4_2 vector4_3];

%% Temperatura na powrocie CO (CO Powr) czêœæ 1

tail5 = '/P7ac8f2a3-7069-484c-b745-dca3ce11bb92;1!N3ASTGVEM5NW4V9/History?start=1526324318000&end=1842548318000&take=100';
URL5 = [api_dp tail5];
headerFields5 = {'Authorization', ['Bearer ', Token]};
options5 = weboptions('HeaderFields', headerFields5,'ContentType','json','MediaType',...
    'application/x-www-form-urlencoded','KeyName','Ocp-Apim-Subscription-Key','KeyValue',API_key)
response5 = webread(URL5,options5)

vector5 = struct2cell(response5.values.values.P7ac8f2a3_7069_484c_b745_dca3ce11bb92_1_N3ASTGVEM5NW4V9);
vector5([1,2,3],:) = [];
size(vector5)

%% Temperatura na powrocie CO (CO Powr) czêœæ 2

tail5_2 = '/P7ac8f2a3-7069-484c-b745-dca3ce11bb92;1!N3ASTGVEM5NW4V9/History?start=1526324318000&end=1842548318000&take=100&skip=100';
URL5_2 = [api_dp tail5_2];
headerFields5_2 = {'Authorization', ['Bearer ', Token]};
options5_2 = weboptions('HeaderFields', headerFields5_2,'ContentType','json','MediaType',...
    'application/x-www-form-urlencoded','KeyName','Ocp-Apim-Subscription-Key','KeyValue',API_key)
response5_2 = webread(URL5_2,options5_2)

vector5_2 = struct2cell(response5_2.values.values.P7ac8f2a3_7069_484c_b745_dca3ce11bb92_1_N3ASTGVEM5NW4V9);
vector5_2([1,2,3],:) = [];
size(vector5_2)

%% Temperatura na powrocie CO (CO Powr) czêœæ 3

tail5_3 = '/P7ac8f2a3-7069-484c-b745-dca3ce11bb92;1!N3ASTGVEM5NW4V9/History?start=1525719518000&end=1526324318000&take=100';
URL5_3 = [api_dp tail5_3];
headerFields5_3 = {'Authorization', ['Bearer ', Token]};
options5_3 = weboptions('HeaderFields', headerFields5_3,'ContentType','json','MediaType',...
    'application/x-www-form-urlencoded','KeyName','Ocp-Apim-Subscription-Key','KeyValue',API_key)
response5_3 = webread(URL5_3,options5_3)

vector5_3 = struct2cell(response5_3.values.values.P7ac8f2a3_7069_484c_b745_dca3ce11bb92_1_N3ASTGVEM5NW4V9);
vector5_3([1,2,3],:) = [];
size(vector5_3)
vector5sum2 = [vector5 vector5_2];
vector5sum3 = [vector5 vector5_2 vector5_3];

%% Temperatura na zasilaniu CWU (CWU Zas) czêœæ 1

tail6 = '/P7ac8f2a3-7069-484c-b745-dca3ce11bb92;1!N3ASTG--K7S3-3P/History?start=1526324318000&end=1842548318000&take=100';
URL6 = [api_dp tail6];
headerFields6 = {'Authorization', ['Bearer ', Token]};
options6 = weboptions('HeaderFields', headerFields6,'ContentType','json','MediaType',...
    'application/x-www-form-urlencoded','KeyName','Ocp-Apim-Subscription-Key','KeyValue',API_key)
response6 = webread(URL6,options6)

vector6 = struct2cell(response6.values.values.P7ac8f2a3_7069_484c_b745_dca3ce11bb92_1_N3ASTG__K7S3_3P);
vector6([1,2,3],:) = [];
size(vector6)

%% Temperatura na zasilaniu CWU (CWU Zas) czêœæ 2

tail6_2 = '/P7ac8f2a3-7069-484c-b745-dca3ce11bb92;1!N3ASTG--K7S3-3P/History?start=1526324318000&end=1842548318000&take=100&skip=100';
URL6_2 = [api_dp tail6_2];
headerFields6_2 = {'Authorization', ['Bearer ', Token]};
options6_2 = weboptions('HeaderFields', headerFields6_2,'ContentType','json','MediaType',...
    'application/x-www-form-urlencoded','KeyName','Ocp-Apim-Subscription-Key','KeyValue',API_key)
response6_2 = webread(URL6_2,options6_2)

vector6_2 = struct2cell(response6_2.values.values.P7ac8f2a3_7069_484c_b745_dca3ce11bb92_1_N3ASTG__K7S3_3P);
vector6_2([1,2,3],:) = [];
size(vector6_2)

%% Temperatura na zasilaniu CWU (CWU Zas) czêœæ 3

tail6_3 = '/P7ac8f2a3-7069-484c-b745-dca3ce11bb92;1!N3ASTG--K7S3-3P/History?start=1525719518000&end=1526324318000&take=100';
URL6_3 = [api_dp tail6_3];
headerFields6_3 = {'Authorization', ['Bearer ', Token]};
options6_3 = weboptions('HeaderFields', headerFields6_3,'ContentType','json','MediaType',...
    'application/x-www-form-urlencoded','KeyName','Ocp-Apim-Subscription-Key','KeyValue',API_key)
response6_3 = webread(URL6_3,options6_3)

vector6_3 = struct2cell(response6_3.values.values.P7ac8f2a3_7069_484c_b745_dca3ce11bb92_1_N3ASTG__K7S3_3P);
vector6_3([1,2,3],:) = [];
size(vector6_3)
vector6sum2 = [vector6 vector6_2];
vector6sum3 = [vector6 vector6_2 vector6_3];

%% Temperatura cyrkulacji CWU (CWU Cyrk) czêœæ 1

tail7 = '/P7ac8f2a3-7069-484c-b745-dca3ce11bb92;1!N3ASTG--JYVYY0R/History?start=1526324318000&end=1842548318000&take=100';
URL7 = [api_dp tail7];
headerFields7 = {'Authorization', ['Bearer ', Token]};
options7 = weboptions('HeaderFields', headerFields7,'ContentType','json','MediaType',...
    'application/x-www-form-urlencoded','KeyName','Ocp-Apim-Subscription-Key','KeyValue',API_key)
response7 = webread(URL7,options7)

vector7 = struct2cell(response7.values.values.P7ac8f2a3_7069_484c_b745_dca3ce11bb92_1_N3ASTG__JYVYY0R);
vector7([1,2,3],:) = [];
size(vector7)

%% Temperatura cyrkulacji CWU (CWU Cyrk) czêœæ 2

tail7_2 = '/P7ac8f2a3-7069-484c-b745-dca3ce11bb92;1!N3ASTG--JYVYY0R/History?start=1526324318000&end=1842548318000&take=100&skip=100';
URL7_2 = [api_dp tail7_2];
headerFields7_2 = {'Authorization', ['Bearer ', Token]};
options7_2 = weboptions('HeaderFields', headerFields7_2,'ContentType','json','MediaType',...
    'application/x-www-form-urlencoded','KeyName','Ocp-Apim-Subscription-Key','KeyValue',API_key)
response7_2 = webread(URL7_2,options7_2)

vector7_2 = struct2cell(response7_2.values.values.P7ac8f2a3_7069_484c_b745_dca3ce11bb92_1_N3ASTG__JYVYY0R);
vector7_2([1,2,3],:) = [];
size(vector7_2)

%% Temperatura cyrkulacji CWU (CWU Cyrk) czêœæ 3

tail7_3 = '/P7ac8f2a3-7069-484c-b745-dca3ce11bb92;1!N3ASTG--JYVYY0R/History?start=1525719518000&end=1526324318000&take=100';
URL7_3 = [api_dp tail7_3];
headerFields7_3 = {'Authorization', ['Bearer ', Token]};
options7_3 = weboptions('HeaderFields', headerFields7_3,'ContentType','json','MediaType',...
    'application/x-www-form-urlencoded','KeyName','Ocp-Apim-Subscription-Key','KeyValue',API_key)
response7_3 = webread(URL7_3,options7_3)

vector7_3 = struct2cell(response7_3.values.values.P7ac8f2a3_7069_484c_b745_dca3ce11bb92_1_N3ASTG__JYVYY0R);
vector7_3([1,2,3],:) = [];
size(vector7_3)
vector7sum2 = [vector7 vector7_2];
vector7sum3 = [vector7 vector7_2 vector7_3];

%% Temperatura zewnêtrzna (Zew) czêœæ 1

tail8 = '/P7ac8f2a3-7069-484c-b745-dca3ce11bb92;1!N3ASTFPG-N7EK27/History?start=1526324318000&end=1842548318000&take=100';
URL8 = [api_dp tail8];
headerFields8 = {'Authorization', ['Bearer ', Token]};
options8 = weboptions('HeaderFields', headerFields8,'ContentType','json','MediaType',...
    'application/x-www-form-urlencoded','KeyName','Ocp-Apim-Subscription-Key','KeyValue',API_key)
response8 = webread(URL8,options8)

vector8 = struct2cell(response8.values.values.P7ac8f2a3_7069_484c_b745_dca3ce11bb92_1_N3ASTFPG_N7EK27);
vector8([1,2,3],:) = [];
size(vector8)

%% Temperatura zewnêtrzna (Zew) czêœæ 2

tail8_2 = '/P7ac8f2a3-7069-484c-b745-dca3ce11bb92;1!N3ASTFPG-N7EK27/History?start=1526324318000&end=1842548318000&take=100&skip=100';
URL8_2 = [api_dp tail8_2];
headerFields8_2 = {'Authorization', ['Bearer ', Token]};
options8_2 = weboptions('HeaderFields', headerFields8_2,'ContentType','json','MediaType',...
    'application/x-www-form-urlencoded','KeyName','Ocp-Apim-Subscription-Key','KeyValue',API_key)
response8_2 = webread(URL8_2,options8_2)

vector8_2 = struct2cell(response8_2.values.values.P7ac8f2a3_7069_484c_b745_dca3ce11bb92_1_N3ASTFPG_N7EK27);
vector8_2([1,2,3],:) = [];
size(vector8_2)

%% Temperatura zewnêtrzna (Zew) czêœæ 3

tail8_3 = '/P7ac8f2a3-7069-484c-b745-dca3ce11bb92;1!N3ASTFPG-N7EK27/History?start=1525719518000&end=1526324318000&take=100';
URL8_3 = [api_dp tail8_3];
headerFields8_3 = {'Authorization', ['Bearer ', Token]};
options8_3 = weboptions('HeaderFields', headerFields8_3,'ContentType','json','MediaType',...
    'application/x-www-form-urlencoded','KeyName','Ocp-Apim-Subscription-Key','KeyValue',API_key)
response8_3 = webread(URL8_3,options8_3)

vector8_3 = struct2cell(response8_3.values.values.P7ac8f2a3_7069_484c_b745_dca3ce11bb92_1_N3ASTFPG_N7EK27);
vector8_3([1,2,3],:) = [];
size(vector8_3)
vector8sum2 = [vector8 vector8_2];
vector8sum3 = [vector8 vector8_2 vector8_3];

%% Temperatura zasilania po stronie wysokociœnieniowej (G³ Zas) czêœæ 1

tail9 = '/P7ac8f2a3-7069-484c-b745-dca3ce11bb92;1!N3ASTFPG_FIELP9/History?start=1526324318000&end=1842548318000&take=100';
URL9 = [api_dp tail9];
headerFields9 = {'Authorization', ['Bearer ', Token]};
options9 = weboptions('HeaderFields', headerFields9,'ContentType','json','MediaType',...
    'application/x-www-form-urlencoded','KeyName','Ocp-Apim-Subscription-Key','KeyValue',API_key)
response9 = webread(URL9,options9)

vector9 = struct2cell(response9.values.values.P7ac8f2a3_7069_484c_b745_dca3ce11bb92_1_N3ASTFPG_FIELP9);
vector9([1,2,3],:) = [];
size(vector9)

%% Temperatura zasilania po stronie wysokociœnieniowej (G³ Zas) czêœæ 2

tail9_2 = '/P7ac8f2a3-7069-484c-b745-dca3ce11bb92;1!N3ASTFPG_FIELP9/History?start=1526324318000&end=1842548318000&take=100&skip=100';
URL9_2 = [api_dp tail9_2];
headerFields9_2 = {'Authorization', ['Bearer ', Token]};
options9_2 = weboptions('HeaderFields', headerFields9_2,'ContentType','json','MediaType',...
    'application/x-www-form-urlencoded','KeyName','Ocp-Apim-Subscription-Key','KeyValue',API_key)
response9_2 = webread(URL9_2,options9_2)

vector9_2 = struct2cell(response9_2.values.values.P7ac8f2a3_7069_484c_b745_dca3ce11bb92_1_N3ASTFPG_FIELP9);
vector9_2([1,2,3],:) = [];
size(vector9_2)

%% Temperatura zasilania po stronie wysokociœnieniowej (G³ Zas) czêœæ 3

tail9_3 = '/P7ac8f2a3-7069-484c-b745-dca3ce11bb92;1!N3ASTFPG_FIELP9/History?start=1525719518000&end=1526324318000&take=100';
URL9_3 = [api_dp tail9_3];
headerFields9_3 = {'Authorization', ['Bearer ', Token]};
options9_3 = weboptions('HeaderFields', headerFields9_3,'ContentType','json','MediaType',...
    'application/x-www-form-urlencoded','KeyName','Ocp-Apim-Subscription-Key','KeyValue',API_key)
response9_3 = webread(URL9_3,options9_3)

vector9_3 = struct2cell(response9_3.values.values.P7ac8f2a3_7069_484c_b745_dca3ce11bb92_1_N3ASTFPG_FIELP9);
vector9_3([1,2,3],:) = [];
size(vector9_3)
vector9sum2 = [vector9 vector9_2];
vector9sum3 = [vector9 vector9_2 vector9_3];

%% Temperatura na powrocie po stronie wysokociœnieniowej (G³ Powr) czêœæ 1

tail10 = '/P7ac8f2a3-7069-484c-b745-dca3ce11bb92;1!N3ASTFPG_EKULUB/History?start=1526324318000&end=1842548318000&take=100';
URL10 = [api_dp tail10];
headerFields10 = {'Authorization', ['Bearer ', Token]};
options10 = weboptions('HeaderFields', headerFields10,'ContentType','json','MediaType',...
    'application/x-www-form-urlencoded','KeyName','Ocp-Apim-Subscription-Key','KeyValue',API_key)
response10 = webread(URL10,options10)

vector10 = struct2cell(response10.values.values.P7ac8f2a3_7069_484c_b745_dca3ce11bb92_1_N3ASTFPG_EKULUB);
vector10([1,2,3],:) = [];
size(vector10)

%% Temperatura na powrocie po stronie wysokociœnieniowej (G³ Powr) czêœæ 2

tail10_2 = '/P7ac8f2a3-7069-484c-b745-dca3ce11bb92;1!N3ASTFPG_EKULUB/History?start=1526324318000&end=1842548318000&take=100&skip=100';
URL10_2 = [api_dp tail10_2];
headerFields10_2 = {'Authorization', ['Bearer ', Token]};
options10_2 = weboptions('HeaderFields', headerFields10_2,'ContentType','json','MediaType',...
    'application/x-www-form-urlencoded','KeyName','Ocp-Apim-Subscription-Key','KeyValue',API_key)
response10_2 = webread(URL10_2,options10_2)

vector10_2 = struct2cell(response10_2.values.values.P7ac8f2a3_7069_484c_b745_dca3ce11bb92_1_N3ASTFPG_EKULUB);
vector10_2([1,2,3],:) = [];
size(vector10_2)

%% Temperatura na powrocie po stronie wysokociœnieniowej (G³ Powr) czêœæ 3

tail10_3 = '/P7ac8f2a3-7069-484c-b745-dca3ce11bb92;1!N3ASTFPG_EKULUB/History?start=1525719518000&end=1526324318000&take=100';
URL10_3 = [api_dp tail10_3];
headerFields10_3 = {'Authorization', ['Bearer ', Token]};
options10_3 = weboptions('HeaderFields', headerFields10_3,'ContentType','json','MediaType',...
    'application/x-www-form-urlencoded','KeyName','Ocp-Apim-Subscription-Key','KeyValue',API_key)
response10_3 = webread(URL10_3,options10_3)

vector10_3 = struct2cell(response10_3.values.values.P7ac8f2a3_7069_484c_b745_dca3ce11bb92_1_N3ASTFPG_EKULUB);
vector10_3([1,2,3],:) = [];
size(vector10_3)
vector10sum2 = [vector10 vector10_2];
vector10sum3 = [vector10 vector10_2 vector10_3];


% Aron Witkowski - Praca magisterska
% Podprogram 2

%% Analiza PCA dla danych temperaturowych

%% Analiza dla macierzy 100x7

A1 = [vector4;vector5;vector6;vector7;vector8;vector9;vector10];
B1 = A1.';
C1 = cell2table(B1);
D1 = table2array(C1);
whos D1

[coeff1,score1,latent1,tsquared1,explained1,mu1] = pca(D1);
figure()
plot(score1(:,1),score1(:,2),'+')
xlabel('1st Principal Component')
ylabel('2nd Principal Component')

figure()
biplot(coeff1(:,1:2),'scores',score1(:,1:2),'varlabels',...
    {'CO Zas','CO Powr','CWU Zas','CWU Cyrk','Zew','G³ Zas','G³ Powr'});

figure()
biplot(coeff1(:,1:3),'scores',score1(:,1:3),'varlabels',...
    {'CO Zas','CO Powr','CWU Zas','CWU Cyrk','Zew','G³ Zas','G³ Powr'});

figure()
plot(1:length(latent1),latent1,'bo-');
line([1,length(latent1)],[0 0],'LineStyle',':','XLimInclude','off',...
     'Color',[.7 .7 .7])
axis([1,length(latent1),min(latent1),max(latent1)*1.1]);
xlabel('Eigenvalue number');
ylabel('Eigenvalue');

%% Analiza dla macierzy 200x7

A2 = [vector4sum2;vector5sum2;vector6sum2;vector7sum2;vector8sum2;vector9sum2;vector10sum2];
B2 = A2.';
C2 = cell2table(B2);
D2 = table2array(C2);
whos D2

[coeff2,score2,latent2,tsquared2,explained2,mu2] = pca(D2);
figure()
plot(score2(:,1),score2(:,2),'+')
xlabel('1st Principal Component')
ylabel('2nd Principal Component')
figure()
biplot(coeff2(:,1:2),'scores',score2(:,1:2),'varlabels',...
    {'CO Zas','CO Powr','CWU Zas','CWU Cyrk','Zew','G³ Zas','G³ Powr'});
figure()
biplot(coeff2(:,1:3),'scores',score2(:,1:3),'varlabels',...
    {'CO Zas','CO Powr','CWU Zas','CWU Cyrk','Zew','G³ Zas','G³ Powr'});
figure()
plot(1:length(latent2),latent2,'bo-');
line([1,length(latent2)],[0 0],'LineStyle',':','XLimInclude','off',...
     'Color',[.7 .7 .7])
axis([1,length(latent2),min(latent2),max(latent2)*1.1]);
xlabel('Eigenvalue number');
ylabel('Eigenvalue');

%% Analiza dla macierzy 300x7

A3 = [vector4sum3;vector5sum3;vector6sum3;vector7sum3;vector8sum3;vector9sum3;vector10sum3];
B3 = A3.';
C3 = cell2table(B3);
D3 = table2array(C3);
whos D3

[coeff3,score3,latent3,tsquared3,explained3,mu3] = pca(D3);
figure()
plot(score3(:,1),score3(:,2),'+')
xlabel('1st Principal Component')
ylabel('2nd Principal Component')
figure()
biplot(coeff3(:,1:2),'scores',score3(:,1:2),'varlabels',...
{'CO Zas','CO Powr','CWU Zas','CWU Cyrk','Zew','G³ Zas','G³ Powr'});
figure()
biplot(coeff3(:,1:3),'scores',score3(:,1:3),'varlabels',...
{'CO Zas','CO Powr','CWU Zas','CWU Cyrk','Zew','G³ Zas','G³ Powr'});

figure()
plot(1:length(latent3),latent3,'bo-');
line([1,length(latent3)],[0 0],'LineStyle',':','XLimInclude','off',...
     'Color',[.7 .7 .7])
axis([1,length(latent3),min(latent3),max(latent3)*1.1]);
xlabel('Eigenvalue number');
ylabel('Eigenvalue');


% Aron Witkowski - Praca magisterska
% Podprogram 3

%% Analiza PCA dla danych temperatury i ciœnienia

%% Ciœnienie w obiegu CO czêœæ 1

tail11 = '/P7ac8f2a3-7069-484c-b745-dca3ce11bb92;1!N3ASTFPG_8ZCMTK/History?start=1526324318000&end=1842548318000&take=100';
URL11 = [api_dp tail11];
headerFields11 = {'Authorization', ['Bearer ', Token]};
options11 = weboptions('HeaderFields', headerFields11,'ContentType','json','MediaType',...
    'application/x-www-form-urlencoded','KeyName','Ocp-Apim-Subscription-Key','KeyValue',API_key)
response11 = webread(URL11,options11)

vector11 = struct2cell(response11.values.values.P7ac8f2a3_7069_484c_b745_dca3ce11bb92_1_N3ASTFPG_8ZCMTK);
vector11([1,2,3],:) = [];
size(vector11)

%% Ciœnienie w obiegu CO czêœæ 2

tail11_2 = '/P7ac8f2a3-7069-484c-b745-dca3ce11bb92;1!N3ASTFPG_8ZCMTK/History?start=1526324318000&end=1842548318000&take=100&skip=100';
URL11_2 = [api_dp tail11_2];
headerFields11_2 = {'Authorization', ['Bearer ', Token]};
options11_2 = weboptions('HeaderFields', headerFields11_2,'ContentType','json','MediaType',...
    'application/x-www-form-urlencoded','KeyName','Ocp-Apim-Subscription-Key','KeyValue',API_key)
response11_2 = webread(URL11_2,options11_2)

vector11_2 = struct2cell(response11_2.values.values.P7ac8f2a3_7069_484c_b745_dca3ce11bb92_1_N3ASTFPG_8ZCMTK);
vector11_2([1,2,3],:) = [];
size(vector11_2)

%% Ciœnienie w obiegu CO czêœæ 3

tail11_3 = '/P7ac8f2a3-7069-484c-b745-dca3ce11bb92;1!N3ASTFPG_8ZCMTK/History?start=1525719518000&end=1526324318000&take=100';
URL11_3 = [api_dp tail11_3];
headerFields11_3 = {'Authorization', ['Bearer ', Token]};
options11_3 = weboptions('HeaderFields', headerFields11_3,'ContentType','json','MediaType',...
    'application/x-www-form-urlencoded','KeyName','Ocp-Apim-Subscription-Key','KeyValue',API_key)
response11_3 = webread(URL11_3,options11_3)

vector11_3 = struct2cell(response11_3.values.values.P7ac8f2a3_7069_484c_b745_dca3ce11bb92_1_N3ASTFPG_8ZCMTK);
vector11_3([1,2,3],:) = [];
size(vector11_3)
vector11sum2 = [vector11 vector11_2];
vector11sum3 = [vector11 vector11_2 vector11_3];


%% Analiza PCA temperatura + ciœnienie dla macierzy 100x7

A4 = [vector4;vector5;vector6;vector7;vector8;vector9;vector10;vector11];
B4 = A4.';
C4 = cell2table(B4);
D4 = table2array(C4);
whos D4

w4 = 1./var(D4);
[coeff4,score4,latent4,tsquared4,explained4,mu4] = pca(D4,...
'VariableWeights',w4);
coefforth4 = inv(diag(std(D4)))*coeff4;

figure()
plot(score4(:,1),score4(:,2),'+')
xlabel('1st Principal Component')
ylabel('2nd Principal Component')

figure()
biplot(coefforth4(:,1:2),'scores',score4(:,1:2),'varlabels',...
    {'CO Zas','CO Powr','CWU Zas','CWU Cyrk','Zew','G³ Zas','G³ Powr','Ciœñ CO'});

figure()
biplot(coefforth4(:,1:3),'scores',score4(:,1:3),'varlabels',...
    {'CO Zas','CO Powr','CWU Zas','CWU Cyrk','Zew','G³ Zas','G³ Powr','Ciœñ CO'});

figure()
plot(1:length(latent4),latent4,'bo-');
line([1,length(latent4)],[0 0],'LineStyle',':','XLimInclude','off',...
     'Color',[.7 .7 .7])
axis([1,length(latent4),min(latent4),max(latent4)*1.1]);
xlabel('Eigenvalue number');
ylabel('Eigenvalue');

%% Analiza PCA temperatura+ciœnienie dla macierzy 200x7

A5 = [vector4sum2;vector5sum2;vector6sum2;vector7sum2;vector8sum2;vector9sum2;vector10sum2;vector11sum2];
B5 = A5.';
C5 = cell2table(B5);
D5 = table2array(C5);
whos D5

w5 = 1./var(D5);
[coeff5,score5,latent5,tsquared5,explained5,mu5] = pca(D5,...
'VariableWeights',w5);
coefforth5 = inv(diag(std(D5)))*coeff5;

figure()
plot(score5(:,1),score5(:,2),'+')
xlabel('1st Principal Component')
ylabel('2nd Principal Component')

figure()
biplot(coefforth5(:,1:2),'scores',score5(:,1:2),'varlabels',...
    {'CO Zas','CO Powr','CWU Zas','CWU Cyrk','Zew','G³ Zas','G³ Powr','Ciœñ CO'});

figure()
biplot(coefforth5(:,1:3),'scores',score5(:,1:3),'varlabels',...
    {'CO Zas','CO Powr','CWU Zas','CWU Cyrk','Zew','G³ Zas','G³ Powr','Ciœñ CO'});

figure()
plot(1:length(latent5),latent5,'bo-');
line([1,length(latent5)],[0 0],'LineStyle',':','XLimInclude','off',...
     'Color',[.7 .7 .7])
axis([1,length(latent5),min(latent5),max(latent5)*1.1]);
xlabel('Eigenvalue number');
ylabel('Eigenvalue');

%% Analiza PCA temperatura+ciœnienie dla macierzy 300x7

A6 = [vector4sum3;vector5sum3;vector6sum3;vector7sum3;vector8sum3;vector9sum3;vector10sum3;vector11sum3];
B6 = A6.';
C6 = cell2table(B6);
D6 = table2array(C6);
whos D6

w6 = 1./var(D6);
[coeff6,score6,latent6,tsquared6,explained6,mu6] = pca(D4,...
'VariableWeights',w6);
coefforth6 = inv(diag(std(D6)))*coeff6;

figure()
plot(score6(:,1),score6(:,2),'+')
xlabel('1st Principal Component')
ylabel('2nd Principal Component')

figure()
biplot(coefforth6(:,1:2),'scores',score6(:,1:2),'varlabels',...
    {'CO Zas','CO Powr','CWU Zas','CWU Cyrk','Zew','G³ Zas','G³ Powr','Ciœñ CO'});

figure()
biplot(coefforth6(:,1:3),'scores',score6(:,1:3),'varlabels',...
    {'CO Zas','CO Powr','CWU Zas','CWU Cyrk','Zew','G³ Zas','G³ Powr','Ciœñ CO'});

figure()
plot(1:length(latent6),latent6,'bo-');
line([1,length(latent6)],[0 0],'LineStyle',':','XLimInclude','off',...
     'Color',[.7 .7 .7])
axis([1,length(latent6),min(latent6),max(latent6)*1.1]);
xlabel('Eigenvalue number');
ylabel('Eigenvalue');


% Aron Witkowski - Praca magisterska
% Podprogram 4

%% Powiadamianie u¿ytkownika w przypadku awarii instalacji

if(score3((score3(:,2))<-3) | score3((score3(:,2))>3) | score3((score3(:,1))<-4) | score3((score3(:,1))>3))
setpref('Internet','SMTP_Server','smtp.gmail.com');
setpref('Internet','E_mail','Twoj_adres_email@gmail.com');
setpref('Internet','SMTP_Username','Twoja_nazwa_uzytkownika');
setpref('Internet','SMTP_Password','Twoje_haslo');
props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');
props.setProperty('mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory');
props.setProperty('mail.smtp.socketFactory.port','465');
sendmail('Twoj_adres_email','UWAGA! Awaria w instalacji wêz³a ciep³a') ;
end


