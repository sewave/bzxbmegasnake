                ORG 40000
MUSICDATA:
                          DEFB 0   ; Loop start point * 2
                          DEFB 16   ; Song Length * 2
PATTERNDATA:              DEFW PAT0
                          DEFW PAT1
                          DEFW PAT2
                          DEFW PAT3
                          DEFW PAT4
                          DEFW PAT5
                          DEFW PAT6
                          DEFW PAT7

; *** Pattern data consists of pairs of note values CH1,CH2 with a single $0 to
; *** mark the end of the pattern, and $01 for a rest
PAT0:
                          DEFB 3  ; Pattern tempo
                          DEFB 84,1
                          DEFB 100,1
                          DEFB 84,1
                          DEFB 100,1
                          DEFB $0
PAT1:
                          DEFB 1  ; Pattern tempo
                          DEFB 99,102
                          DEFB 102,99
                          DEFB 99,102
                          DEFB 102,99
                          DEFB $0
PAT2:
                          DEFB 1  ; Pattern tempo
                          DEFB 84,1
                          DEFB 86,1
                          DEFB 88,1
                          DEFB 93,1
                          DEFB 91,1
                          DEFB 89,1
                          DEFB $0
PAT3:
                          DEFB 1  ; Pattern tempo
                          DEFB 60,66
                          DEFB 62,68
                          DEFB 65,70
                          DEFB 67,73
                          DEFB $0
PAT4:
                          DEFB 1  ; Pattern tempo
                          DEFB 60,1
                          DEFB 1,61
                          DEFB 72,1
                          DEFB 1,73
                          DEFB 84,1
                          DEFB 1,85
                          DEFB $0
PAT5:
                          DEFB 1  ; Pattern tempo
                          DEFB 85,1
                          DEFB 1,84
                          DEFB 73,1
                          DEFB 1,72
                          DEFB 61,1
                          DEFB 1,60
                          DEFB $0
PAT6:
                          DEFB 2  ; Pattern tempo
                          DEFB 87,1
                          DEFB 1,90
                          DEFB 88,1
                          DEFB $0
PAT7:
                          DEFB 1  ; Pattern tempo
                          DEFB 74,1
                          DEFB 1,78
                          DEFB 78,1
                          DEFB 1,78
                          DEFB 74,1
                          DEFB 1,80
                          DEFB 78,1
                          DEFB 1,80
                          DEFB 79,1
                          DEFB 1,82
                          DEFB 80,1
                          DEFB 1,82
                          DEFB 82,1
                          DEFB 1,1
                          DEFB $0
