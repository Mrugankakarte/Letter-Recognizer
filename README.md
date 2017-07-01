# Letter-Recognizer

The project is based on [notMNIST dataset](http://yaroslavvb.com/upload/notMNIST/). It is similar to MNIST dataset but instead contains letters of different fonts from __A-J__. Many solved example for this dataset can be found for python.

There are two categories of data available to download
* __Small__: Has almost 20000 images in total which is handcleanedwith an approx. 0.5% label error.
* __Large__: This dataset is not cleaned and has about 500k images in total with an approx 6.5% label error.

The problem was solved using convolutional neural networks. `keras` package was used to develop the model. First dataset in form of matrix was created for each letter with labels. All the datasets of each letter __(A-J)__ were combined together. For testing last 72-73 images from each letter were seperated out and saved seperately test data. They were not used for training. Final form of training and test data is available in _data_ folder. The model and its weights are saved in _saves_ folder, they can be used as pre-trained model. Following are the results for my model

* __Test accuracy: 95.1657 %__ 
* __Validation accuracy: 96.3 %__
* __Training accuracy: 96.24 %__

__NOTE:__

I have used small dataset for training. Since almost all the images are trained with black background and white font, the model does not predict well when the case is reversed i.e. with white background and black font. Hence, while feeding test images to the network please ensure that they have black background. Also images taken from digital camera have very high resoultion; my model has input of 28x28 pixels, hence most of the information is lost while reducing the size of image from high resolution to 28x28 pixels.  
