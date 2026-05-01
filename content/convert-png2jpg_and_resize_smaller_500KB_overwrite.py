import os
from PIL import Image

# Thư mục gốc cần quét
root_dir = r"E:\ws\2603w3_web\khoahoc.xyz\content"

# Ngưỡng dung lượng (500KB)
size_limit = 500 * 1024  

def compress_image(input_path, target_size=size_limit):
    """Chuyển ảnh sang JPG và giảm dung lượng xuống dưới target_size, ghi đè file gốc."""
    img = Image.open(input_path).convert("RGB")
    quality = 95
    while True:
        img.save(input_path, "JPEG", quality=quality)
        if os.path.getsize(input_path) <= target_size or quality <= 10:
            break
        quality -= 5

for subdir, _, files in os.walk(root_dir):
    for file in files:
        if file.lower().endswith((".jpg", ".jpeg", ".png")):
            file_path = os.path.join(subdir, file)
            if os.path.getsize(file_path) > size_limit:
                compress_image(file_path)
                print(f"Đã nén và ghi đè: {file_path}")
