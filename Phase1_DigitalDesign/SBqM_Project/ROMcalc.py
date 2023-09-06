for Tcount in range(1,4):
    for Pcount in range(0,8):
        if(Pcount == 0):
            Wtime = 0
        else:
            Wtime = 3*(Pcount + Tcount -1)/Tcount
        print(Wtime)