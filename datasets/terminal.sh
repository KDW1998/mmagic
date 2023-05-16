''' You must do datasets/terminal.sh before handling this command'''

# preparing DIV2K dataset URL
https://mmagic.readthedocs.io/en/latest/dataset_zoo/div2k.html?highlight=div2k

#Crop sub-images
python tools/dataset_converters/div2k/preprocess_div2k_dataset.py --data-root ./data/DIV2K

'''
Set5 and Set14 Dataset have to downloaded on google drive that in mmagic doc
'''



# multi-gpu train
./tools/dist_train.sh configs/edsr/edsr_x4c64b16_1xb16-300k_div2k.py 4
