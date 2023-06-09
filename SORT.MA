[top]
components : sort

[sort]
type : cell
width : 15
height : 2
delay : transport
defaultDelayTime  : 10
border : wrapped 
neighbors : sort(-1,-1) sort(-1,0) sort(-1,1) 
neighbors : sort(0,-1)  sort(0,0)  sort(0,1)
neighbors : sort(1,-1)  sort(1,0)  sort(1,1)
initialvalue : 0
initialrow :  0    ? 10 15 18  2  4  0  5 11 23  1  3  2 14  ?
initialrow :  1    ?  1  ?  1  ?  1  ?  1  ?  1  ?  1  ?  1  ?
localtransition : sort-rule

[sort-rule]
rule : ?        10 { (0,0) = ? and (1,0) = ? }
rule : ?        10 { (0,0) = 1 and (0,1) = ? and (0,-1) = ? }
rule : 1        10 { (0,0) = ? and (-1,0) != ? }
rule : {(0,1)}  10 { (0,0) != ? and (1,0) = 1 and (0,0) > (0,1) and (0,1) != ? }
rule : {(0,-1)} 10 { (0,0) != ? and (1,0) = ? and (0,-1) > (0,0) and (0,-1) != ? }
rule : {(0,0)}  10 { (0,0) != ? and (1,0) = 1 and (0,0) <= (0,1) and (0,1) != ? }
rule : {(0,0)}  10 { (0,0) != ? and (1,0) = ? and (0,-1) <= (0,0) and (0,-1) != ? }
rule : {(0,0)}  10 { (0,0) != ? and (1,0) = 1 and (0,1) = ? and (1,1) = ? }
rule : {(0,0)}  10 { (0,0) != ? and (1,0) = ? and (0,-1) = ? and (1,-1) = ? }
