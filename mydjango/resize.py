import os
import shutil
for i in range(0,31):
    path="G:/NormalOCT/matlab_process/OCTimgs/OCT_CUBE/"+str(i+1)+"/oct"

    count=0
    filelist=os.listdir(path)
    for files in filelist:
        Olddir=os.path.join(path,files)
        if os.path.isdir(Olddir):
            continue
        shutil.copy(Olddir, "G:\oct2018\yuan")