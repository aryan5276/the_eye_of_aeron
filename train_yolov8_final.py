import numpy as np # linear algebra
import pandas as pd # data processing, CSV file I/O (e.g. pd.read_csv)
import os
from sklearn.model_selection import train_test_split
import shutil
from ultralytics import YOLO
import torch
import cv2
from torch.utils.mobile_optimizer import optimize_for_mobile

def preprocessing():
    IMAGES_PATH = "" # Path to all images being trained
    LABELS_PATH = "" # Path to the label for each image being trained

    labels = os.listdir(LABELS_PATH)

    # Split the data into train, test, and validation sets
    train, test = train_test_split(labels, test_size=0.2, shuffle=True)
    valid, test = train_test_split(test, test_size=0.5)

    print(f"train: {len(train)}; valid: {len(valid)}; test: {len(test)}")
    
    if (os.path.exists("../test/images/") is False):
        os.makedirs("../test/images/")
    
    if (os.path.exists("../test/labels/") is False):
        os.makedirs("../test/labels/")
    
    if (os.path.exists("../train/images/") is False):
        os.makedirs("../train/images/")
    
    if (os.path.exists("../train/labels/") is False):
        os.makedirs("../train/labels/")
    
    if (os.path.exists("../valid/images/") is False):
        os.makedirs("../valid/images/")
    
    if (os.path.exists("../valid/labels/") is False):
        os.makedirs("../valid/labels/")
    
    def move_files_to_dir(files, dirname):     
        for label_file_name in files: 
            image_file_name = f"{label_file_name[:-4]}.jpg"
            
            # The datasets we used had files stored in only .jpg and .JPEG formats
            if (os.path.exists(IMAGES_PATH + "/" + image_file_name) is False): 
                image_file_name = f"{label_file_name[:-4]}.JPEG"

            # Add the image to the directory if it exists            
            if (os.path.getsize(IMAGES_PATH + "/" + image_file_name) > 0): 
                img = cv2.imread(IMAGES_PATH + "/" + image_file_name)

                shutil.copy(f"{IMAGES_PATH}/{image_file_name}", f"{dirname}/images/")
                shutil.copy(f"{LABELS_PATH}/{label_file_name}", f"{dirname}/labels/")

    move_files_to_dir(train, "../train")
    print("Files moved to train folder")
    move_files_to_dir(test, "../test")
    print("Files moved to test folder")
    move_files_to_dir(valid, "../valid")
    print("Files moved to valid folder")
    
    print("Train test split done!")
    

preprocessing()

device = torch.device('cuda') if torch.cuda.is_available() else torch.device('cpu')

model = YOLO('yolov8m.pt')
model.to(device)
model.train(data="../dataset.yaml", epochs=50)

torch.save(model.state_dict(), 'model_state_dict.pt')
# torch.save(model, 'model.pt')

example = torch.rand(1, 3, 224, 224)
traced_script_module = torch.jit.trace(model, example)
optimized_traced_model = optimize_for_mobile(traced_script_module)
optimized_traced_model._save_for_lite_interpreter("model_lite.pt")