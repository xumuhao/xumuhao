from django.shortcuts import render
from django.http import HttpResponse

def runoob(request):
    return render(request, 'runoob.html')
def index(request):
    return render(request, 'index.html')
def model(request):
    return render(request, 'model.html')
def resume(request):

    return render(request, 'resume.html')
def services(request):
    return render(request, 'services.html')
def work(request):
    if request.method == 'POST':
        # 获取图片文件
        img_data = request.FILES['file']
        # 将图片文件写入本地
        with open('dome/assets/images/uploads.bmp', 'wb+') as f:
            for i in img_data.chunks():
                f.write(i)
        return render(request=request, template_name='work.html')
    return render(request, 'work.html')



def contact(request):
    return render(request, 'contact.html')
