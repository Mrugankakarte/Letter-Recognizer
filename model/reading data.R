library(keras)
library(abind)
###################################################################################################

image_size = 28               # height and width of image
pixel_depth = 255             #no of levels per pixel
      
### Load data for each letter ####
create_letter_dataset <- function(folder, min_num_img){
      image_files <- list.files(folder) 
      img_dataset <- array(0, dim = c(length(image_files), image_size, image_size))
      print(folder)
      num_images = 0
      
      for(i in image_files){
            img_file <- paste(folder, i, sep = "")
            x <- image_load(img_file, target_size = c(28,28), grayscale = T)
            x <- image_to_array(x, data_format = "channels_last")/255
            x <- matrix(x, 1*28, 28)
            img_dataset[num_images,,] <- x 
            num_images <- num_images + 1
      }
      
      ifelse(num_images > min_num_img, yes = print("Complete..."), no = print("Incomplete...."))
      
      return(img_dataset)
      
}

create_labels <- function(dataset, letter){
      
      dim_dataset <- dim(dataset)[1]
      labels_dataset <- array(0, dim = c(dim_dataset, 1))
      for(i in 1:dim_dataset){
            labels_dataset[i,] <- letter      
      }
      print("Complete...")
      return(labels_dataset)
}


### A ####      
saveRDS(object = a_dataset, file = "data/new/a.rds")
saveRDS(object = a_labels, file = "data/new/label_a.rds")
a <- readRDS("data/new/a.rds")
a_labels <- readRDS("data/new/label_a.rds")

a_test <- a[1800:1871,,]
a_test_labels <- a_labels[1800:1871]
a_train <- a[1:1799,,] 
a_train_labels <- a_labels[1:1799]
saveRDS(a_train, "data/train/train_a.rds")
saveRDS(a_train_labels, "data/train/train_a_labels.rds")
saveRDS(a_test, "data/test/test_a.rds")
saveRDS(a_test_labels, "data/test/test_a_labels.rds")

### B ####
saveRDS(object = b_dataset, file = "data/new/b.rds")
saveRDS(object = b_labels, file = "data/new/label_b.rds")
b <- readRDS("data/new/b.rds")
b_labels <- readRDS("data/new/label_b.rds")

b_test <- b[1800:1872,,]
b_test_labels <- b_labels[1800:1872]
b_train <- b[1:1799,,] 
b_train_labels <- b_labels[1:1799]
saveRDS(b_train, "data/train/train_b.rds")
saveRDS(b_train_labels, "data/train/train_b_labels.rds")
saveRDS(b_test, "data/test/test_b.rds")
saveRDS(b_test_labels, "data/test/test_b_labels.rds")
### C ####
saveRDS(object = c_dataset, file = "data/new/c.rds")
saveRDS(object = c_labels, file = "data/new/label_c.rds")
c <- readRDS("data/new/c.rds")
c_labels <- readRDS("data/new/label_c.rds")

c_test <- c[1800:1872,,]
c_test_labels <- c_labels[1800:1872]
c_train <- c[1:1799,,] 
c_train_labels <- c_labels[1:1799]
saveRDS(c_train, "data/train/train_c.rds")
saveRDS(c_train_labels, "data/train/train_c_labels.rds")
saveRDS(c_test, "data/test/test_c.rds")
saveRDS(c_test_labels, "data/test/test_c_labels.rds")

### D ####
saveRDS(object = d_dataset, file = "data/new/d.rds")
saveRDS(object = d_labels, file = "data/new/label_d.rds")
d <- readRDS("data/new/d.rds")
d_labels <- readRDS("data/new/label_d.rds")

d_test <- d[1800:1872,,]
d_test_labels <- d_labels[1800:1872]
d_train <- d[1:1799,,] 
d_train_labels <- d_labels[1:1799]
saveRDS(d_train, "data/train/train_d.rds")
saveRDS(d_train_labels, "data/train/train_d_labels.rds")
saveRDS(d_test, "data/test/test_d.rds")
saveRDS(d_test_labels, "data/test/test_d_labels.rds")

### E ####
saveRDS(object = e_dataset, file = "data/new/e.rds")
saveRDS(object = e_labels, file = "data/new/label_e.rds")
e <- readRDS("data/new/e.rds")
e_labels <- readRDS("data/new/label_e.rds")

e_test <- e[1800:1872,,]
e_test_labels <- e_labels[1800:1872]
e_train <- e[1:1799,,] 
e_train_labels <- e_labels[1:1799]
saveRDS(e_train, "data/train/train_e.rds")
saveRDS(e_train_labels, "data/train/train_e_labels.rds")
saveRDS(e_test, "data/test/test_e.rds")
saveRDS(e_test_labels, "data/test/test_e_labels.rds")

### F ####
saveRDS(object = f_dataset, file = "data/new/f.rds")
saveRDS(object = f_labels, file = "data/new/label_f.rds")
f <- readRDS("data/new/f.rds")
f_labels <- readRDS("data/new/label_f.rds")

f_test <- f[1800:1871,,]
f_test_labels <- f_labels[1800:1871]
f_train <- f[1:1799,,] 
f_train_labels <- f_labels[1:1799]
saveRDS(f_train, "data/train/train_f.rds")
saveRDS(f_train_labels, "data/train/train_f_labels.rds")
saveRDS(f_test, "data/test/test_f.rds")
saveRDS(f_test_labels, "data/test/test_f_labels.rds")

### G ####
saveRDS(object = g_dataset, file = "data/new/g.rds")
saveRDS(object = g_labels, file = "data/new/label_g.rds")
g <- readRDS("data/new/g.rds")
g_labels <- readRDS("data/new/label_g.rds")

g_test <- g[1800:1871,,]
g_test_labels <- g_labels[1800:1871]
g_train <- g[1:1799,,] 
g_train_labels <- g_labels[1:1799]
saveRDS(g_train, "data/train/train_g.rds")
saveRDS(g_train_labels, "data/train/train_g_labels.rds")
saveRDS(g_test, "data/test/test_g.rds")
saveRDS(g_test_labels, "data/test/test_g_labels.rds")

### H ####
saveRDS(object = h_dataset, file = "data/new/h.rds")
saveRDS(object = h_labels, file = "data/new/label_h.rds")
h <- readRDS("data/new/h.rds")
h_labels <- readRDS("data/new/label_h.rds")

h_test <- h[1800:1871,,]
h_test_labels <- h_labels[1800:1871]
h_train <- h[1:1799,,] 
h_train_labels <- h_labels[1:1799]
saveRDS(h_train, "data/train/train_h.rds")
saveRDS(h_train_labels, "data/train/train_h_labels.rds")
saveRDS(h_test, "data/test/test_h.rds")
saveRDS(h_test_labels, "data/test/test_h_labels.rds")

### I ####
saveRDS(object = i_dataset, file = "data/new/i.rds")
saveRDS(object = i_labels, file = "data/new/label_i.rds")
i <- readRDS("data/new/i.rds")
i_labels <- readRDS("data/new/label_i.rds")

i_test <- i[1800:1871,,]
i_test_labels <- i_labels[1800:1871]
i_train <- i[1:1799,,] 
i_train_labels <- i_labels[1:1799]
saveRDS(i_train, "data/train/train_i.rds")
saveRDS(i_train_labels, "data/train/train_i_labels.rds")
saveRDS(i_test, "data/test/test_i.rds")
saveRDS(i_test_labels, "data/test/test_i_labels.rds")

### J ####
saveRDS(object = j_dataset, file = "data/new/j.rds")
saveRDS(object = j_labels, file = "data/new/label_j.rds")
j <- readRDS("data/new/j.rds")
j_labels <- readRDS("data/new/label_j.rds")

j_test <- j[1800:1871,,]
j_test_labels <- j_labels[1800:1871]
j_train <- j[1:1799,,] 
j_train_labels <- j_labels[1:1799]
saveRDS(j_train, "data/train/train_j.rds")
saveRDS(j_train_labels, "data/train/train_j_labels.rds")
saveRDS(j_test, "data/test/test_j.rds")
saveRDS(j_test_labels, "data/test/test_j_labels.rds")


### Combining training and test data #####
train_data <- abind(a_train,b_train,c_train,d_train,e_train,f_train,g_train,h_train,i_train,j_train, along = 1)
saveRDS(train_data, "data/train/train.rds")
train_labels <- abind(a_train_labels,b_train_labels,c_train_labels,d_train_labels,e_train_labels,f_train_labels,g_train_labels,h_train_labels,i_train_labels,j_train_labels,along = 1)
saveRDS(train_labels,"data/train/train_labels.rds")

test_data <- abind(a_test,b_test,c_test,d_test,e_test,f_test,g_test,h_test,i_test,j_test, along = 1)
saveRDS(test_data, "data/test/test.rds")
test_labels <- abind(a_test_labels,b_test_labels,c_test_labels,d_test_labels,e_test_labels,f_test_labels,g_test_labels,h_test_labels,i_test_labels,j_test_labels,along = 1)
saveRDS(test_labels,"data/test/test_labels.rds")

