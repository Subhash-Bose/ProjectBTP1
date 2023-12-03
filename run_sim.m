%Run this file to run the simulation

clc;
m_value=[0.2 0.3 0.5 0.7 0.8];
l_no=[1 2 3 4];
table=ones(5,4);

for jjj=1:5
    m_actual=m_value(jjj);
    fault=1;
    run("test_setup.m");
    m_array;
    table(jjj,:)=m_array(:);
    % clear all;
end

table