# example of loading the generator model and generating images
from keras.models import load_model
from numpy.random import randn
from matplotlib import pyplot as plt
 

# generate points in latent space as input for the generator
def generate_latent_points(latent_dim, n_samples):
	# generate points in the latent space
	x_input = randn(latent_dim * n_samples)
	# reshape into a batch of inputs for the network
	x_input = x_input.reshape(n_samples, latent_dim)
	return x_input
 
# plot the generated images
def create_plot(examples, n):
    # plot images
    plt.figure(figsize=(16, 10), dpi=500)
    for i in range(n * n):
        # define subplot
        plt.subplot(n, n, 1 + i)
        # turn off axis
        plt.axis('off')
		# plot raw pixel data
        pixel_data = examples[i, :, :]
        plt.imshow(pixel_data)
        cmap = plt.cm.jet
        image_name = "image_"+ str(i) + ".png"
        # plt.imsave(image_name, pixel_data, cmap=cmap)
        
    plt.show()
 
# load model
model = load_model('generator_model_500.h5')
# generate images
latent_points = generate_latent_points(100, 100)
# generate images
X = model.predict(latent_points)
# scale from [-1,1] to [0,1]
X = (X + 1) / 2.0
# plot the result
create_plot(X, 10)