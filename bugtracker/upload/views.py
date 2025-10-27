from django.shortcuts import render
from django.core.files.storage import FileSystemStorage
from django.http import HttpResponse


# Create your views here.
def image_upload(req):
    if req.method == "POST" and req.FILES["img_file"]:
        imgf = req.FILES["img_file"]
        fs = FileSystemStorage()
        filename = fs.save(imgf.name, imgf)
        img_url = fs.url(filename)
        return render(req, "upload.html", {
            "img_url": img_url
        })
    return render(req, "upload.html")


def view_img(req, filename):
    fs = FileSystemStorage()
    if not fs.exists(filename):
        return HttpResponse("404 not found")
    url = fs.url(filename)
    return render(req, "img_view.html", {
        "img_url": url
    })
