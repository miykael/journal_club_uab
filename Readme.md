# Nipype and beyond!

This repository contains the slides and notebooks used for the neuroimaging journal club at University of Alabama at Birmingham in March 2020.

### Notebooks

The easiest way to run the notebooks is to download the [docker](https://www.docker.com/) image `miykael/uab` from [docker hub](https://hub.docker.com/repository/docker/miykael/uab) and run it with the following command:

```docker run -it --rm -p 8888:8888 miykael/uab```

After executing this command, copy past the URL from the terminal into your webbrowser and you should be good to go!

### Slides

The slides unfortunately don't seem to work within the docker image. To see them, just download the two files `slides.html` and `remark-latest.min.js`, but them in the same folder and open `slides.html`. To also have access to all images contained in the slides, additionally download the folder `static` and put it next to the `slides.html` file.