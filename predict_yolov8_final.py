from ultralytics import YOLO
import cv2

model = YOLO("../runs/detect/train/weights/best.pt")

# Add all file names here
arr = [
        'file name.jpg'
       ]

results = model(arr)  # return a list of Results objects
for i in range(len(results)):
    boxes = results[i].boxes  # Boxes object for bbox outputs
#     print(boxes.data[0][5].item())
    img = cv2.imread(arr[i])  # img RGB from Paths
    cv2.rectangle(img, (int(boxes.xyxy[0][0].item()), int(boxes.xyxy[0][1].item())), 
                  (int(boxes.xyxy[0][2].item()), int(boxes.xyxy[0][3].item())), (0, 255, 255), 2)
    
    height, width, channels = img.shape 
    
    larger = max(height, width)
    if (larger == height):
        resized = cv2.resize(img, (640, int(640 * height / width)))
    else:
        resized = cv2.resize(img, (int(640 * width / height), 640))
    
    names = ['multi-rotor', 'fixed-wing', 'single-rotor', 'VTOL', 'bird']
    cv2.putText(resized, names[int(boxes.data[0][5].item())], 
                (int(boxes.xyxy[0][2].item()), int(boxes.xyxy[0][1].item())), 
                cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 255), 2, cv2.LINE_AA)
        
    cv2.imshow('Image' + str(i), resized)
    cv2.waitKey(0)
