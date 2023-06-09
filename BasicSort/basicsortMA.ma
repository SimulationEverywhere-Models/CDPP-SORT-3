[top]
components : sort

[sort]
type : cell
width : 15
height : 2
delay : transport
defaultDelayTime  : 10
border : nowrapped 
neighbors : sort(-1,-1) sort(-1,0) sort(-1,1) 
neighbors : sort(0,-1)  sort(0,0)  sort(0,1)
neighbors : sort(1,-1)  sort(1,0)  sort(1,1)
initialvalue : 0
initialrow :  0    7.3 10.02 15.11 18.2  -2.3  4.24  0.23  5.55 11.34 23.12  1.05  3.76  2.11 14.56 -4.64
initialrow :  1      1     ?     1    ?     1     ?     1     ?     1     ?     1     ?     1     ?     1
localtransition : sort-rule

[sort-rule]
rule : ?        10 { (0,0) = 1 and ( (0,1) = ? or (0,-1) = ? ) }
rule : 1        10 { (0,0) = ? }
rule : {(0,1)}  10 { (1,0) = 1 and (0,0) > (0,1) }
rule : {(0,-1)} 10 { (1,0) = ? and (0,-1) > (0,0) }
rule : {(0,0)}  10 { t }
