# Sin(x)Cos(X) 

![image](https://68.media.tumblr.com/55a641b9d5e4566f1af916891eef1699/tumblr_oowpz0AGXq1wo8gcfo1_1280.png)


### What is it? 
In April 2017 I started generating charts in R based on [trigonometric functions](https://stat.ethz.ch/R-manual/R-devel/library/base/html/Trig.html) like sin(x) and cos(x). The results can be found on the Tumblr [sinxcosx.tumblr.com](https://sinxcosx.tumblr.com/archive). 


### How do you get from nothing to the images on Tumblr?

I open R and type in the following: 

```R
x = seq(-100,100,0.01)
plot(cos(x),sin(x), cex = 0.1)
# cex controls the size of the point
```

I get this as a result: 

![image](https://68.media.tumblr.com/fe00ab26acef7ba25dff22e7593564ae/tumblr_ootrmdzM5m1wo8gcfo1_1280.png)

Then I top up my game. The more complex my equation, the more complex the chart. I trail-and-error around until I get an interesting image, then I save that line of R code in the `# BEST`-section of my R file. And I screenshot the image and put it in a folder called “best”. I then use [`Tumblr-Upload`](https://github.com/miohtama/tumblr-upload) to publish the new images in this folder to Tumblr on a regular basis with the following command: 

```
./upload.sh ~/Desktop/1704_SinxCosx/best
```

It’s a rewarding way to doodle on rainy Saturdays or while watching a crappy movie. Some is pretty, some is kitsch, some is ugly; but it’s always surprising. 



### Which numbers do you plot?  

I generate two sequences of loots of numbers. For that, I generated `x` and `y` the following way: 

```R
x = seq(-100,100,0.01)
y = seq(-10,10,0.0001)
```

That tells R to create numbers from -100 to 100 in steps of 0.01: 

```R
-100.00  -99.99  -99.98  -99.97  -99.96  -99.95  -99.94  -99.93  -99.92	  -99.91  -99.90  -99.89  -99.88  -99.87  -99.86  -99.85  -99.84  -99.83  -99.82  -99.81  -99.80  -99.79  -99.78  -99.77  -99.76  -99.75  -99.74  -99.73  -99.72  -99.71  -99.70  -99.69  -99.68  -99.67  -99.66  -99.65 …
```

The more numbers, the more “refined” and “clean” your final plot looks, but the more time it takes to calculate and render the plot. `x` has 20k values and `y` has 200k values. They’re both enough for my use case. 

I wanted positive AND negative values (-100 to 100) because then I can use `abs` in an interesting way. 


### Which functions do you plot? 

I use numbers and any combination of the following: 

```R
abs(x)
sqrt(x)
log10(x)
log2(x)
log1p(x)
exp(x)
expm1(x)
cos(x)
sin(x)
tan(x)
acos(x)
asin(x)
atan(x)
cospi(x)
sinpi(x)
tanpi(x)
```

e.g.: 

```R
plot(cospi(x*abs(tan(x)))*cos(x),sin(x), cex = 0.1)
plot(sinpi(cos(y*2)),sinpi(sinpi(y))*cos(y*100), cex = 0.1)
```

Don’t underestimate the numbers. In the last line, it’s a huge difference in aesthetics if the number is 2 or 20. 


### Should I use your code? 

Well, you can. They lead to pretty images. But not in the most pretty way. Meaning: I have very little knowledge of trigonometric functions, and everything is a huge trial and error. I often use super-complicate, nested `acos(sinpi(sinpi(x)))` for an image that could have been generated with just one trigonometric function instead of three. 