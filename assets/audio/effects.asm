                ORG 40000
MUSICDATA:
                          DEFB 0   ; Loop start point * 2
                          DEFB 24   ; Song Length * 2
PATTERNDATA:              DEFW PAT0
                          DEFW PAT1
                          DEFW PAT2
                          DEFW PAT3
                          DEFW PAT4
                          DEFW PAT5
                          DEFW PAT6
                          DEFW PAT7
                          DEFW PAT8
                          DEFW PAT9
                          DEFW PAT10
                          DEFW PAT11

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
                          DEFB 99,1
                          DEFB 102,1
                          DEFB 99,1
                          DEFB 102,1
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
                          DEFB 60,1
                          DEFB 62,1
                          DEFB 65,1
                          DEFB 67,1
                          DEFB $0
PAT4:
                          DEFB 1  ; Pattern tempo
                          DEFB 60,1
                          DEFB 61,1
                          DEFB 72,1
                          DEFB 73,1
                          DEFB 84,1
                          DEFB 85,1
                          DEFB $0
PAT5:
                          DEFB 1  ; Pattern tempo
                          DEFB 85,1
                          DEFB 84,1
                          DEFB 73,1
                          DEFB 72,1
                          DEFB 61,1
                          DEFB 60,1
                          DEFB $0
PAT6:
                          DEFB 2  ; Pattern tempo
                          DEFB 87,1
                          DEFB 90,1
                          DEFB 88,1
                          DEFB $0
PAT7:
                          DEFB 1  ; Pattern tempo
                          DEFB 74,1
                          DEFB 78,1
                          DEFB 78,1
                          DEFB 78,1
                          DEFB 74,1
                          DEFB 80,1
                          DEFB 78,1
                          DEFB 80,1
                          DEFB 79,1
                          DEFB 82,1
                          DEFB 80,1
                          DEFB 82,1
                          DEFB 82,1
                          DEFB $0
PAT8:
                          DEFB 1  ; Pattern tempo
                          DEFB 112,1
                          DEFB $0
PAT9:
                          DEFB 1  ; Pattern tempo
                          DEFB 91,1
                          DEFB 60,1
                          DEFB 91,1
                          DEFB 1,1
                          DEFB 91,1
                          DEFB 74,1
                          DEFB 91,1
                          DEFB 1,1
                          DEFB 91,1
                          DEFB 89,1
                          DEFB 91,1
                          DEFB $0
PAT10:
                          DEFB 1  ; Pattern tempo
                          DEFB 84,1
                          DEFB 99,1
                          DEFB 86,1
                          DEFB 88,1
                          DEFB 102,1
                          DEFB $0
PAT11:
                          DEFB 1  ; Pattern tempo
                          DEFB 102,1
                          DEFB 102,1
                          DEFB 1,1
                          DEFB 92,1
                          DEFB 92,1
                          DEFB 1,1
                          DEFB 93,1
                          DEFB 93,1
                          DEFB $0
