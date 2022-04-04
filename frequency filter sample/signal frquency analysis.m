Welcome to the lesson on frequency analysis.
In the last lesson, we saw examples of
smoothing and sharpening filters.
These are filters designed to suppress or
enhance high-frequency content in a signal.
More generally, how can we
determine what is the frequency content of a signal?
So far, we have just visualize
the waveforms and inspected
whether there were lots of oscillations.
However, we have tools that let us
quantify the power of
different frequencies contained in a signal.
The main tool for
this frequency analysis is called the Fourier transform,
named after French mathematician Fourier.
Specifically for discrete time signals
such as those we represent in MATLAB.
This is the discrete Fourier transform.
This is implemented in MATLAB as the function FFT,
which stands for the fast Fourier transform.
This function efficiently converts a time-domain signal,
that is a signal that varies over time,
into a frequency domain signal,
that is a signal that is
represented not by how it changes over time,
but by how much different frequencies
contribute to the signal.
This will not only let us easily see or
quantify what frequencies exist in the signal,
we can also very easily manipulate
the frequency content of a signal
in the frequency domain and then
return the manipulated signal to
the time domain form using the inverse Fourier transform,
which is implemented as IFFT in MATLAB.
Let's go to MATLAB and see how this works.
Let's start by creating a basic signal that is
the sum of two cosines as we have done before.
We start by defining a sampling frequency
Fs of 13,200 hertz.
In frequencies, there are two cosines will be f1 equal
to 440 hertz and F2 equal to 660 hertz.
We'll make our signal five seconds long.
We first define our time variable T
to range from 0 in steps of 1
over Fs to time t minus 1 over Fs.
Then we can define our cosine signals.
First, y1, which is
a cosine with frequency f1 equal to 440 hertz.
Then Y2, which is a cosine with frequency 660 hertz.
We also add a phase to this cosine of Pi over 4 radians.
We have a phase shifted 660 hertz cosine.
Finally, our combined signal is y is equal to y1 plus y2.
We know that for this signal we have a frequency content
add 440 hertz and add 660 hertz.
Thus when we do frequency analysis on this signal,
we should see power at these frequencies.
Next we plot our signals,
we'll ultimately have nine plots that we want to show.
Let's use a three-by-three grid of subplots.
We'll show y1 in the first subplot.
We can zoom in on the first 10 oscillations of
it using the axis function.
Next, in a second subplot,
we'll show y2 and
zoom in on the first 15 oscillations of it.
Finally, in a third subplots,
we show the combined signal
and zoom in on the first five oscillations of it.
We will not focus on this detail,
but for those who are interested in
the mathematics of periodic signals,
we can note that the period of a signal that is
a combination of two periodic signals is
one divided by the largest common denominator of
the frequencies of the two individual pure tone signals.
Since y1 has a frequency of
440 and y2 has a frequency of 660,
the largest common denominator is 220,
440 is 2 times 220 and 660 is 3 times 220.
When we combine the two signals into a combined signal y,
y will be periodic with period 1 divided by 220.
To show five oscillations of y we plot
it from 0-5 divided by 220.
Next, let's listen to our signals.
We can first listen to the 440 hertz pure tone.
Next, the higher frequency 660 hertz pure tone.
Finally, the combined signal,
which with the trained ear,
you may recognize as being
the two tones played simultaneously.
Next, let's compute our FFT
and look at the first 10 entries.
Well, that's interesting.
We can see in the first 10 entries of our FFT,
it looks like MATLAB prints two numbers for each entry,
with the second number ending with the letter i.
What's up with this?
We can also see that MATLAB calls
this data type complex double rather than just double.
These are what are called complex numbers.
We will dive into why we need
complex numbers with the FFT,
but first, what are they?
Complex numbers are different from real numbers.
A full treatment of complex numbers
is beyond the scope of this course,
but a basic understanding is needed to
understand why they are needed for signal analysis.
One can consider real numbers to be one dimensional.
Real numbers increase from negative to
positive values in one dimension on a line.
Complex numbers, on the other hand,
formulate a two-dimensional coordinate system,
where one axis is
the real number line and
the other axis are so-called imaginary numbers.
A complex number has two components,
a real part and an imaginary part.
We have the real number part of
the complex number plane running from left to
right and the imaginary part of
the complex number plane running from down to up.
A complex number represented in
so-called rectangular form looks
like the format we saw in MATLAB.
We state the value of the real part plus
the value of the imaginary part multiplied by i,
where i represents the square root of minus 1.
Mathematically, the fact that i is
the square root of minus 1 is of deep importance.
But here, we don't need to worry too much about the math,
and it is entirely sufficient
to simply think of it here as
an indicator to differentiate
the imaginary part of
the complex number from the real part.
An example would be this complex number
c. It falls at this location in the complex plane.
Its position is defined by both its real part,
which is x equals 0.9,
and its imaginary part,
which is y equals 0.5.
So c equals 0.9 plus 0.5i.
In general, we can define
any complex number c as being equal to x plus i times y,
where x and y are any real numbers.
For all complex numbers that fall on
the real number axis where y equals zero,
this set of complex numbers are all perfectly real.
Real numbers are actually a subset of
complex numbers that have
an imaginary component that is equal to zero.
We can similarly state that
all complex numbers with real part x equal to
0 fall on our imaginary axis
and are entirely imaginary numbers.
Thus, purely imaginary numbers are
also a subset of complex numbers.
One more trick and then we're ready to
come back to the FFT in MATLAB.
We've discussed representing complex numbers in
this rectangular form where we
define c to be x plus i times y,
but we can equivalently represent
any complex number in a polar coordinate system.
With polar coordinates, instead of using x and y,
we define a 2D position by
its displacement vector from the origin.
More specifically, the length of the displacement vector,
which is equal to the magnitude of the complex number,
defines the distance from the point to the origin.
The angle the vector makes with
the positive side of the real axis called Theta,
these are the two quantities needed to
define position in this 2D system.
Here, if we know the length of
vector c and its angle Theta relative to the real axis,
we know where it falls on our complex plane.
Mathematically, we can go back and forth
easily between these two representations.
The length of the vector is
the magnitude of the complex number,
which is the square root of x squared plus y squared.
Theta is the inverse tangent of y divided by x.
In reverse, if we know the magnitude and angle,
we can convert it to x and y using
the trigonometric sine and cosine functions.
In the special case where the magnitude
of the complex number is equal to 1,
the length of the vector is equal to 1 and
c falls a distance of one from the origin.
This space of solutions where magnitude of c equals 1,
but data can take any value,
are set to fall on
the unit circle which is shown as the black circle here.
On the unit circle,
when Theta is equal to 0,
c equals one and is a real number.
When Theta is Pi over 2 radians, c equals i.
When Theta is Pi radians,
c again is a real number equal to minus 1.
At 3Pi over 2,
c is minus i and purely imaginary again.
Circling back to 2Pi,
c again is equal to 1.
So we have the basics
about the general 2D nature of complex numbers.
So now we can talk about why we
need these 2D numbers with the Fourier transform.
For the case of real valued signals,
which is where we will limit our scope,
the Fourier transform tells us
how to represent the signal as
a sum of scaled cosine waves
that oscillate at different frequencies.
Each entry in our FFT
corresponds to a specific frequency cosine wave.
The complex number in that entry in
our FFT needs to represent two quantities.
One, the amplitude of
a cosine that oscillates at that frequency,.
Two, the phase shift of
the cosine that oscillates at that frequency.
Ultimately, our signal can be represented
by the sum of this set of cosines that are
scaled and phase shifted
according to the complex numbers provided by the FFT.
As a result, the FFT also tells
us about the frequency content of the signal.
If the complex number and the FFT entry
corresponding to a specific frequency
has a small magnitude,
that means that a cosine of
that frequency doesn't contribute much to
the overall signal and
thus that frequency is not present in the signal.
On the other hand, entries in the FFT with
large magnitude indicate a lot
of power in the signal at that frequency.
Here's a question, how
many different cosines do we
need to be able to represent a signal?
As it turns out,
this is a function of
how many discrete time points we have in our signal y.
Let's look at some small-scale examples to see why.
These examples will also give us
a tangible flavor of what the FFT is doing for us.
First, we have a signal y that is equal to
minus 1 at time 0 and one at time 1.
We can easily define a cosine
that passes through these two data points.
Our FFT would tell us that for a cosine of frequency,
fs over 2 equals one-half hertz.
We would multiply it with
an amplitude of one and phase shift it by Pi.
The cosine itself is a continuous function.
We can see that using
half an oscillation of the cosine phase shifted by Pi,
the value of this continuous function is equal
to y at discrete times 0 and 1,
where y is defined.
In general, we can approximate
any two data points with
two cosines of specific frequencies.
For two data points where
sampling frequency fs equals one hertz,
we can use one cosine with a frequency of zero and
another with frequency fs over 1 equals one-half hertz.
The FFT then finds
the amplitude and phase that are needed to apply to
these two cosines in order for
their sum to pass through our signal samples.
A cosine with zero frequency is just a constant,
so we can see
our zero Hertz cosine is a flat line equal to 1.
A cosine with frequency fs over 2,
an amplitude one with
zero phase looks like our one-half hertz cosine.
The FFT tells us that we need 1 of cosine 1 plus
1 of cosine 2 phase shifted by
Pi in order to approximate this signal.
The zero frequency term
captures the average value of our signal.
Here, our y is equal to minus 1 and plus 1.
So it has an average value of zero.
But if instead y was equal to 0 and 2,
our whole plot would shift up by
one and we would want 1 of cosine of
1 plus 1 of cosine 2 phase
shifted by Pi to approximate our signal y.
Let's add one more sample to y.
Now we have three samples and our y
is equal to minus 1 at time 0,
one at time 1, and zero at time two.
We can still use just two cosines for three data points.
The frequencies of our cosines are
predetermined as a function
of the number of data points and
the sampling frequency of our signal.
For three data points with fs equals 1 hertz,
we will use a zero hertz cosine
and a one-third hertz cosine.
The average value of our signal is still zero,
so the FFT tells us that in
this case again we do not need
any of the zero hertz cosine
in the FFT cosine representation.
However, for the one-third hertz cosine,
we need a magnitude of 2 times square root of 3 over 3,
and we need a phase shift of minus Pi over 6.
It is noteworthy that
our FFT cosine representation
is defined by three numbers.
The frequencies of the cosines shown here in red are
predetermined by the sampling frequency
and the number of data points in y.
The actual values in y do not matter.
No matter what values y takes on,
they can be represented as the sum of
cosines of those predetermined frequencies.
Further, fs will change the frequency of the cosines,
but not the number of cosines that are needed.
The number of cosines is
entirely a function of the number of data points.
For any three data point y,
no matter what values it takes
on and no matter what the sampling frequency,
we can always represent it as the sum of two cosines.
The first cosine is always
a zero hertz cosine to
represent the average value of the signal.
For this term, there is no phase as
the phase shift of a zero hertz cosine is meaningless.
Then we have the magnitude
and phase of our second cosine.
In total, our FFT needs to compute three numbers
to represent our signal as a sum of cosines.
In summary, with y,
we have three data points and
our FFT needs to compute three unknowns.
This should sound familiar from linear algebra.
When solving a linear system
of three equations and three unknowns,
the linear system is fully
determined and we can compute an exact answer.
This is precisely what's going on here.
We are in fact solving
a linear system for the complex numbers used to define
the amplitude and phase of
cosine functions used to represent the signal.
This explains why a signal with
three data points needs two cosines.
With two cosines, we have
three degrees of freedom in our cosine
fit with the amplitude of
the zero hertz cosine and
the amplitude and phase of the second cosine.
What happens when we add a fourth sample?
Here we add a fourth sample at time three equal to 1.5.
Now we have four samples that we need
to represent as a sum of cosines.
With only two cosines and one of them being zero hertz,
we have only three degrees of freedom.
We need to add
an extra cosine to bring our total to three.
With three cosines, we have
up to five potential degrees of freedom.
Carrying out this sequence to its logical conclusion,
you can probably anticipate that for signals
composed of n data points,
we need n plus 2 divided by 2 cosines if n is even,
and n plus 1 divided by 2 if n is odd.
When n is equal to four and
our sampling frequency is one hertz,
our cosines have frequencies zero,
one-quarter hertz, and 1.5 hertz.
The FFT tells us that for such cosines,
we can represent our signal with the following equation.
As the signal becomes more complicated,
so does our cosine representation.
Again, the frequencies of
the cosine in red are predetermined,
but the FFT tells us the five numbers we need in green.
We can continue growing our signal.
With five data points,
we end up with the results in
green as a function of three cosines.
Now, here's a new signal y with six data points but
with values sampled from a normal random distribution.
We need four cosines in this case,
which becomes difficult to see
if we continue to try to plot them here,
so we just view the result.
We could go arbitrarily high with this,
but soon it gets too dense to plot.
Here is a result with 50 data points
in a normally distributed random valued signal y.
As we can see, the FFT will always give us
the right complex numbers to define the amplitudes
and phases for a set of cosine to represent our signal.
Let's go back to MATLAB and
demonstrate the power of the FFT.
Recall we have a signal y formed by the sum of
a 440 hertz cosine and a phase shifted 660 hertz cosine.
Now let's compute the FFT.
We will find it useful to write
our own FFT function
that performs two steps in
addition to using the FFT function.
Here's what I call myfft function,
which takes as input our signal
y and the sampling frequency Fs.
The first thing we do is use
MATLAB's fft function to compute the standard fft.
Next, we can throw away part
of the fft results that we do not need.
As we saw in the lecture slides,
for a real valued signal with n data points,
we need the sealing of n plus 1 divided by 2 cosines.
But the fft returns a result that has
n data points. Why is that?
The reason is that the fft function works for both
real valued and complex valued signal inputs.
When the signal is complex,
we have n complex values which are 2 times n numbers,
the n real plus n
imaginary numbers that we need to approximate.
That requires 2 times n degrees of freedom for our fits,
which would require all n complex numbers
in the fft result.
It also requires the use of
complex waves instead of simple cosines.
Since we will only discuss real valued signals
here because this includes
wide domains like sound signals,
it turns out that if we limit
ourselves to real valued signals,
we can throw away just about half of
the fft output without losing any information.
In fact, we only need the first seal of
length of y plus 1 divided by 2 entries.
There are many part of the fft that we
throw away corresponds to what are called
negative frequency components that we would
need if we wanted to represent complex valued signals.
Next, we can also compute the frequencies that
each entry in the fft corresponds to.
This is not something MATLAB gives us by
default but knowing these frequency numbers is useful.
As we will see in the next section,
the so-called Nyquist theorem tells us
that if the sampling frequency
of a discrete time signal is Fs,
the maximum frequency representable
in that signal is Fs divided by 2.
Thus, the frequencies we can extract from our signal
y range from 0 to Fs divided by 2.
The fft will assume we use
cosines with uniformly spaced frequencies in this range.
We define sampnum to be our sample numbers,
which is a sequence of integers running from
0 to length yfft minus 1.
Then we can define our frequencies f as
sampnum multiplied by Fs over length y.
Recall the units of Fs
is samples per second, in other words,
hertz times samples and
length y is the number of samples,
so we convert our sample numbers to hertz,
which are our frequencies in f in hertz, and that's it.
This code tells us the frequencies of
the cosines in the range from 0 to
Fs over 2 hertz that
can be summed to represent our signal.
Next, we will also
find it useful to write a plot function.
We will call MagnitudeSpectrumPlot,
which will take as input our yfft in frequency vectors.
We'll have an optional third parameter
for the color that's used in the plot.
If the number of arguments input is less than 3,
we will default our color perimeter to b for blue.
Then we plot the magnitude of
the Fourier components as a function of frequency.
We label the x-axis is showing frequency in
Hz and the y-axis
is showing the magnitude of capital Y as a function of f,
which is shorthand for
the frequency components of little y of t.
Let's use our new functions.
Recall a signal y is
an audio signal that we can play with soundsc.
The my fft function,
let us compute our yfft and frequency vector
f and we can plot the results in another subplot.
We use our magnitude spectrum plot function
with inputs yfft into
f. We can give the title, Magnitude Spectrum.
We can see that our plot function has plotted
the magnitude spectrum which
shows the Fourier components to all be 0,
except for at two frequencies,
which correspond to 440 Hz and 660 Hz.
The magnitude of the Fourier components are 0
everywhere except for these two frequencies.
For example, looking at the first 10 components,
we see that we get numbers with
magnitude on the order of 10 to the minus 9,
which are consistent with
floating point round-off errors.
Looking at the 440 Hz component,
we see it has a magnitude of 33,000 in the real part.
We look at the length of y divided by two,
we see that that is equal to
the magnitude of our Fourier component.
So we can see when we divide the magnitude of
our Fourier component by length of y over two,
we arrive at one,
which is the amplitude of
the 440 Hz cosine component of the signal.
Similarly, when we look at
the magnitude of the 660 Hz component,
we also see that it's equal to 33,000,
and that's if we divide this by the length of y over two,
we also arrive at one,
which is the amplitude of the 660 Hz component.
Although this Fourier component has
a non-zero phase, that is,
when we look at both the real part
and the imaginary part,
we see they're both non-zero.
Using the angle function,
we can see that the angle
of this component is Pi over four,
corresponding to the phase of
the 660 Hz cosine that we created.
In summary, we have confirmed that we can
use the fft to extract the power of
specific frequency content in a signal and
the phase angle of those frequencies
needed to reconstruct the signal.
Next, let's demonstrate how to do this.
We're going to demonstrate how to
use the Fourier transform to
reconstruct a signal as a sum of cosines.
Let's start with a more complicated signal,
then a sum of two pure tones.
Let's load a speech audio sample from MATLAB.
This loads into y,
five seconds of a speech signal.
We can create our time independent variable.
It's ranging from time 0 in steps of 1 divided by
Fs to length of y minus 1 divided by Fs.
Playing it, we can
here it is a speech segment
regarding the Fourier transform.
The discrete Fourier transform of
a real value signal is conjugate symmetric.
Can also plot it
and also plot the Fourier
transform magnitude spectrum plot.
We can see this is a much more complex signal
than the two pure tones signal we saw before,
and thus we have non-negligible power
and frequencies across the whole spectrum.
We are going to display our reconstruction of the signal
from cosines progressively in the second subplot.
We start with zeros and a vector called ycos,
then we define a for
loop to loop over the frequencies we have in yfft,
to progressively add in each iteration to ycos.
The magnitude of the fft for the ith frequency divided by
the length of the signal y to scale
a cosine with frequency f
at i plus phase
equal to the angle of the fft at the ith frequency.
So this is a cosine of a frequency f at
i with its amplitude and phase determined by the fft.
Next, we need to put this into
an if statement because we need to do things
slightly differently for frequencies zero or Fs over 2.
So when i is equal to 1,
we have our zero hertz component,
or in the last iteration
if the frequency is exactly equal to Fs over 2,
then this is the correct code.
Otherwise, if we are at other frequencies
between zero and Fs over 2,
we need to have
the length of y so that we're
dividing by length of y divided by 2,
effectively doubling the magnitude.
That's it. This for loop will
reconstruct our signal y as a sum
of cosines using the fft results.
We can verify that y is equal to ycos by
taking the sum of
the squared differences between the two.
We see the differences between y and ycos are
minuscule and consistent with
tiny floating-point precision errors.
Let's run that for loop again.
But this time let's add plotting
an audio code to visualize and hear the quality of
our cosine approximation as we progressively
add higher and higher frequency content to our signal.
Within our for-loop, we're going to add
another if statement that
will update the plot every 100 iteration.
So if the modulus off i,
after dividing by 100 is equal to 0,
then i is a multiple of 100 and
we will plot our signal ycos.
We can give it a title.
This is an approximation of y of t
as a sum of i cosines with magnitude
determined by the magnitude
of the Fourier transform
and phase determined
by the angle of the Fourier transform.
This is in a loop, so we need to use drawnow to
request MATLAB to stop and redraw
the figure before proceeding to the next iteration.
We close our for-loop and run it.
We can see as we add higher and higher frequency
content to our cosine approximation of our signal y of t,
the signal appears to get closer and
closer to the shape of signal y of t.
There's still a few spots where
some of the higher frequency content
has not quite been recovered.
But as we can see from our magnitude spectrum plot,
there's a broad range of
higher frequencies that contribute,
some to the overall signal,
but have relatively little energy
compared to the lower frequencies.
We can see the final result,
plot of ycos is identical to y.
Next, let's run it again,
but with audio to
hear what the approximation sounds like.
Let's also pause less frequently,
say at four time points;
once we reach 500 hertz,
1,500 hertz, 2,500 hertz, and 3,500 hertz.
We start with a new variable,
fbrk, which we'll set to be 500,
for stopping at 500 hertz.
We reset ycos to be zeros and repeat our for-loop.
Now, instead of stopping every 100 iterations,
we'll stop whenever our frequency,
f at i, becomes greater than fbrk.
We repeat our plotting code
and we also add to the third subplot,
a red line at the frequency where we're breaking.
This will be a vertical red line at x location f at i,
with height ranging from 0-600.
We can play our audio approximation
using the soundsc function.
We include pause, so that the code will pause at
this point until the user hits Enter on the keyboard.
To wrap things up,
we also changed the value of fbrk by adding 1,000 to it.
The first time this if statement is executed is when
the frequencies in f at i become greater than 500 hertz.
Because that's our original value for fbrk,
and by incrementing it by 1,000,
now this if statement will execute again whenever
our frequencies f at i become greater than 1,500 hertz.
Then we'll increased by another 1,000 hertz,
so then we'll stop again at
2,500 and then again at 3,500 hertz.
The discrete Fourier transform of a real valued signal
is conjugate symmetric.
When we run it, we pause
after 500 hertz has been included,
which amounts to 2,497 cosines.
We hear the muffled sounding version of the audio signal.
That muffled quality is what
results when we remove all frequencies
higher than 500 hertz and only
keep frequencies lower than 500 hertz in our signal.
From afar, our ycos signal already
looks much like the signal y in our plot.
But if we zoom in on a section,
we can see differences.
While the overall shape in
ycos generally it looks similar,
we can see that much of the
quickly changing high-frequency content
that exists in y does not exist in ycos.
We can hit Enter now and continue on.
The discrete Fourier transform of a real valued signal
is conjugate symmetric.
Next, we have ycos as a sum of 7,487 cosines,
to reconstruct our signal with frequencies
up to 1,500 hertz.
That already sounds much less
muddled and we are still ignoring all frequencies
from 1,500-4,000 hertz. Going again.
The discrete Fourier transform of
a real valued signal is conjugate symmetric.
Now we add frequencies up to 2,500
hertz with 12,477 cosines,
and that signal sounds almost as good as the real one.
In the power spectrum,
it does not look like much is going on in this region.
But if we zoom in,
we can see there is a low-level of
power coming from frequencies
in this band that is still
needed to accurately represent the sound signal.
The discrete Fourier transform
of a real valued signal is conjugate symmetric.
We can appreciate that as we
add in our high frequency content,
we ultimately fully reconstruct our signal
from individual frequency components.
This demonstration reveals two important concepts.
First, it shows that
the FFT provides us the information needed to
define the magnitude and phase of
each cosine used to represent
the signal as a sum of cosines.
We showed that by summing cosines using the FFT,
we can reconstruct the signal.
But more importantly, we can detect
the amount of power in a signal in
different frequency bands and display
it as the magnitude spectrum for the signal.
This is arguably the most
fundamental of all signal analysis tasks.
Not only can we detect it,
we can easily manipulate our signal by
picking and choosing the frequencies we want.
We can boost the power in
some frequencies and diminish it in others,
or we can remove all power from specific frequency bands.
This is the process called filtering.
For example, we can define
a high-pass filter that will let
all frequencies greater than
1,500 hertz remain in the signal.
While removing all other frequencies.
It is called a high-pass
filter because it is designed to let
all the high frequencies pass through it while
filtering out frequencies lower than 1,500 hertz.
This filter H is equal to one for
all frequencies greater than 1,500
hertz and equal to zero otherwise.
To apply the filter,
we simply do an element-wise multiplication
of the FFT of this signal with the filter.
This gives us the Fourier transform
of the filtered result,
where the amplitudes of the cosines
we would use to reconstruct the function.
They have frequencies less than
1,500 hertz, have been zeroed out.
We can plot the spectrum of
this new signal on top of the old one in red.
As you can see in the plot,
we simply delete all
of the lower-frequency portion of the spectrum.
What we have left is the remaining portion in red.
How would we reconstruct this high-pass filtered signal?
Well, we could use a for loop as we did
above and sum together all the cosine one by one,
but this is really inefficient.
It is much faster to use
Matlab's IFFT function or
Inversed Fast Fourier Transform function,
to inverse the frequency domain representation
back to a time-domain representation.
We'll create a myFFT function.
Myifft function will look like this.
We'll take this input, the Fourier transform,
our frequency vector, and sampling frequency Fs.
We need an if statement to
properly rebuild the portion of
the FFT that we threw away in our myFFT function.
If our FFT does contain frequency Fs over 2,
then our full FFT for signal y can be reconstructed
by computing the ifft of yfft,
followed by the complex conjugate of
reversed entries and yfft from 2 to end minus 1,
corresponding to the frequencies
between 0 and Fs over 2 hertz.
We need to reverse this vector using the flip up
down and append it to the end of the vector,
then we can just use Matlab's IFFT function
to compute the time domain signal y.
Else, if we don't have frequency Fs over 2,
we do exactly the same thing,
but for entries to end of our yfft array,
since there is no entry at
the end for frequency Fs over 2.
What we are doing is ensuring that the FFT we input in
a Matlab's IFFT function is "Conjugate symmetric".
As the speech in the audio file says,
the Fourier transform of
a real-valued signal is conjugate symmetric.
That is the tail of the Fourier transform is
the mirrored complex conjugate of the front of
the Fourier transform for real-valued signals.
For real-valued signals,
these entries provide no additional information.
The only reason these components are
ever needed is in case
y is a complex rather than a real valued signal.
In that case, these components are not generally
equal to the complex conjugate of the first components.
This situation involves mathematics
that are beyond the scope of this course.
For our purposes, we can just ensure
our myFFT and myIFFT functions
are exactly as demonstrated,
and they'll work for any real valued signal.
With our function in place,
our filtered output signal y
high-pass can be found with one simple line of
code using our myIFFT function.
Then we can plot it.
We can see that it does look quite different from y of
t. We can also listen to it.
Listening to it, we can hear that it is absent of
lower pitch tones and
only the high frequency content remains.
Of course this can be repeated for a low pass filter,
where we let low frequencies pass through the filter,
but filter out high frequencies.
This is a low pass filter at 500 hertz.
We can see in green where we're retaining all of
the information below 500 hertz
and throwing the rest of it away.
The y low pass
is that my IFFT of the results,
and we can listen to it.
When we remove all frequencies beyond 500 hertz,
we get that muffled quality where all of
the high-pitched tones have been removed.
We can pick out a different frequency band to keep,
instead of having a high pass or a low pass filter,
we can have a so-called band pass filter,
where we keep frequencies greater than
500 and less than 1,500.
Again, we filter our signal in exactly the same way,
and we can show the magnitude spectrum in magenta,
and we can see in our magnitude spectrum plot,
this signal has frequencies between 500 and 1,500 hertz,
outside of that, all of the energy has been zeroed out.
Our y band pass is the same as the y low pass,
we compute the my IFFT of our filtered results.
You can see it also looks quite
different from our original signal y of
t and we can listen to it.
We hear a very different results
with the band pass signal.
Next, let's look at an example with
filtering a noisy signal rather than a clean signal.
We read in a noisy signal,
and we can listen to it,
we hear that it is indeed very noisy.
Next we find the Fourier
transform and plot the magnitude spectrum.
We see lots of power exists
in the high frequency content of this signal,
which is where most of our noise is located.
We should try a low-pass filter.
Let's try eliminating frequencies
greater than 1,500 hertz.
We can see in our plot that in our filtered result,
the spectrum has zeroed out
all information beyond 1,500 hertz frequencies.
Now, let's listen to it.
Compared to our original signal,
much of the noise has been eliminated.
The trade-off is that we have also removed
some high-frequency content from the signal itself,
so the speech does not sound as sharp.
Noise reduction is always
a trade-off between how much noise
can be removed without affecting
the quality of the signal too much.
This far, we have looked at what are called
ideal or square wave frequency filters.
Square wave filters keep the entirety of
the desired frequencies and
completely remove the undesired ones.
Often, smoother transition filters are used and have
more desirable mathematical and practical properties
than so-called ideal filters.
For example, one of the most common filters
is Gaussian filter.
Gaussians have
many mathematical properties that make them
desirable as signal processing filters.
Let's compare the Gaussian and square wave filter.
In a new figure, we will have frequency on
the x-axis and
filter magnitude on the y-axis.
We can plot our square wave filter.
We will do so in this plot by
mirroring the frequencies across the origin.
Visualizing both negative and positive frequencies is
another common approach
for visualizing frequency spectra.
But the magnitude spectra are always mirrored about
the origin for real-valued signals
like the ones that we deal with.
However, momentarily switching to
this visualization approach will help us
appreciate why our filters are
called square wave and Gaussian filters.
We plot with frequency values that are mirrored about
the origin using the minus flip up down function,
followed by the positive frequencies.
Then we set the y values using
the same mirroring approach for our filter
H.
I missed a semicolon.
Now, we can instantly see why this
is termed a square wave filter.
In the frequency spectrum,
it takes the form of
a square wave that rises discontinuously to one
and falls back down to zero for a specific band of
low frequencies less than 1,500 hertz.
Next, a comparable Gaussian filter.
We set the Sigma for the Gaussian to be
equal to 1,500 hertz.
Let's also define a signed frequency variable,
SF using our negative and positive frequencies.
Then we can plot, as a function of
a signed frequencies, our Gaussian.
The Gaussian function is
the natural exponent raised to the power of minus
our signed frequencies squared
divided by 2 times our Sigma squared.
There's also, traditionally, a scaling factor
used to normalize the integral of the Gaussian function.
However, this is often ignored for
signal processing applications because it
is often more convenient to
retain the maximum value of one,
where the argument of the exponent is zero.
That's when our frequency,
f, is equal to zero,
and have to have values that
diminish from one towards zero,
for greater deviations from the zero frequency.
We can add a legend. The Gaussian shape,
the normal distribution bell curve is unmistakable.
The so-called bell curve has a maximum height of one,
where f is equal to zero,
then smoothly decreases towards
zero as we move away from the zero frequency.
The point of steepest descent
is where f is equal to Sigma,
which, in this case, is 1,500.
This is why we choose
the Sigma for the Gaussian as our cutoff frequency.
Using this smoothly
sloping frequency suppression function,
as opposed to the square wave filter,
can often produce better results with fewer odd effects.
Let's try it out. Here is our Gaussian filter, H,
with g Sigma equal to 1,500 hertz.
Can apply it to our signal.
Let's take a look at the results in a plot.
We'll plot the Gaussian filter results in green.
We can see in the power spectrum,
we never really drop to zero,
but beyond 1,500 hertz,
the power in these frequencies is quickly
suppressed to very small magnitudes.
We use the my IFFT function
to reconstruct the filtered results.
Now, let's compare how these three signals sound.
First, the original, very noisy signal.
When we play this signal,
pay attention to the S sounds that are
the high-frequency parts of
the speech that cut through the noise.
For this tree, Fourier transform of
the real-valued Sigma was conjugate symmetric.
Now the YLP, which was
created using the ideal square wave filter.
Again, pay attention to the S sounds.
For this tree, Fourier transform of
the real-valued Sigma was conjugate symmetric.
You can hear the noise has been reduced,
but those S sounds have almost entirely been eliminated.
Now our Gaussian low-pass.
For this tree, Fourier transform of
the real-valued Sigma was conjugate symmetric.
We get almost as good noise reduction,
but the speech still sounds clear,
and the S sounds are retained when we use the Gaussian,
rather than the IDL filter.
Next, let's look at something that's not
speech, but rather, music.
Let's load our rock guitar sample
and add our distortion effect,
where we clip the maximum value of our signal.
We're actually clipping the magnitude of
the signal so that
the positive numbers can be no greater than max,
and the negative numbers can be no less than minus max.
We'll listen to a portion of it.
This tends to create a lot of power in
high frequencies due to the introduction
of the very sharp changes to
the signal that we create when we clip it,
and it also tends to suppress lower frequencies.
We can see this if we look at magnitude spectrum plots.
Zooming in, we can see we've
reduced our low-frequency content in our red signal,
and in the high frequency region,
our new signal has much more content.
We can try to clean this up a bit by doing
some low-pass filtering and
low pass low frequency amplification.
Let's create a Gaussian filter
with a Sigma equal to 3,000.
We multiply it by five so that
the filter actually amplifies the low-frequency content.
We've amplified our low frequencies to
about the same level that they were originally.
Zooming in, we can
see suppression of the high-frequency content.
We again use our myifft function
or reconstruct the result.
We can listen to it.
First our original signal,
then the raw distortion result,
and now distortion with boosting of the low frequencies.
If listening with a sound system that has
decent low and high frequency response,
a trained ear can hear we have
a fuller sounding signal
without so much high-frequency fuzz.
There are many other frequency filter design tools
available in MATLAB that could
assist with designing filters that can be built
in the real world using circuits, for example.
For example, we saw the use of
finite impulse response filters in our previous lesson.
However, direct manipulation of the spectrum using
the Fourier transform is
the most versatile method
for manipulating frequency content.
MATLAB also provides some built-in tools for analyzing
how frequencies in a signal change over time.
For example, in our guitar signal, sometimes,
low pitch single strings are strummed generating
relatively low frequency content and other times,
all strings are strummed,
generating broad spectrum power in the signal.
Let's first load the 44.1
kilohertz version of our guitar signal,
and we can listen to the first four seconds of it.
Listening to the first four seconds,
we hear three broad strums
interleaved by single string plucks.
So how can we use MATLAB to
analyze how the frequency content changes over time?
Spectrograms are plots that do exactly this.
In order to analyze frequency as a function of time,
we have to consider windows of time.
Within a time window,
the spectrogram will use the FFT to analyze the frequency
content then do the same for
the next time window and the next, and so on.
These time windows can overlap and there are
many options that can be
determined for how the windows should overlap.
These choices are all application
dependent and could require some tuning to get right.
Here we'll leave most of this
at the default values but we
will choose what is often the most important parameter,
the window size.
We choose the window size to be 1,024 samples,
where with a sampling rate
of Fs equals to 44.1 kilohertz,
this gives us a time window
of approximately 25 milliseconds.
We leave the next parameters at
default with square brackets,
then we tell the function our sampling frequency.
So what are our outputs?
We see s is a matrix that's 513 rows by 343 columns,
f is a 513 by
1 vector containing the frequencies
of the Fourier transform,
t is a 1 by 343 vector containing
the times at which a window of the signal was
sampled and a Fourier transform was computed.
S contains the Fourier transform
complex coefficients that result.
Each column of s is a 513 row by 1 vector
corresponding to the FFT of
the signal in that time window
corresponding to that column.
So in this matrix,
we have 343 different Fourier transforms
that have been performed on
small sub-components of the signal.
We can inspect a few of
the Fourier coefficients in the first four rows and
four columns in the matrix
s. So what's a better way to display the results?
We can't display them the same way we
did with their magnitude spectrum plots.
There we had a single spectrum,
here we have 343,
so plotting them the same way
would make interpretation impossible,
but 2D data, we can display as an image.
So to display the result,
we'll use the imagesc function,
which can display an image in a figure window.
We'll see more about image display in
the following lesson on Image Analysis with MATLAB.
We provide imagesc with
the x-axis coordinates of each column of
the matrix to be displayed
as an image using the frequency vector f,
the y-axis coordinates of each row of the matrix to be
displayed using the time vector t, and then,
similarly to the magnitude spectrum plus that we've done,
we want to display the magnitude of the FFT components.
Here we transpose s so that
the frequency dimension is on
the columns and the time dimension is on the rows.
We take the logarithm of
the magnitude of the Fourier coefficients to
heighten the smaller magnitude content.
Colorbar provides a legend
that tells us how the numbers in
the matrix being displayed are translated into
the colors assigned to the display pixels.
Axis xy makes the y-axis point
up in the direction that time increases,
and finally we can label our axis.
We have frequency in hertz on the x-axis,
we have time in seconds on the y-axis.
Going from down to up,
we move forward in time in our four second signal.
On the x axis,
we have frequency in hertz increasing from left to right.
At every xy location in our plot,
a color is shown indicating
the magnitude of the FFT coefficient.
What is shown is the magnitude
of the the frequency content for
each frequency in the signal on
the x-axis as a function of time on the y-axis.
Each horizontal line in a plot
corresponds to 125 millisecond time window,
where colors shown on that horizontal line are
akin to the height of our 2D magnitude spectrum plots.
Instead of having one magnitude spectrum plot
for the entire signal,
the spectrogram generates individual plots
for small time windows.
Does the content makes sense?
It looks like at time zero,
not much is going on.
This is before the guitar is being played.
Then we see some low frequency energy around
time 0.25 as strings are being plucked.
Then around time 0.75,
we see broad spectrum power
to high frequencies that tapers down over time.
This is when all the strings on a guitar being strummed,
and that strummed note is being held momentarily.
We again pluck
some lower frequency notes around time 2.25,
then have another strum at time 2.75,
and again, at time 3.75.
The spectrogram contains
a very useful visual representation
of how frequency content and
the signal changes over time.
Let's listen to the sound again
with the spectrogram displayed.
While I play the sound,
we can also draw a line on
our spectrogram corresponding to the passage of time.
We start with this if one statement,
and so we're going to wrap all of our code in
this if statement so that it
doesn't execute until we end the if statement.
Soundsc will kick off
our sound, but not immediately.
On my MATLAB Online,
I find I need to pause for about
0.35 seconds for the sound to actually start playing.
At this point, we wish to begin showing our line.
Tic starts the clock at time zero.
We will keep drawing the figure in
a while loop for four seconds.
We use a while loop that stops when
our time tm becomes larger than four.
We hold off to permit redrawing the figure,
then we repeat our spectrogram plot identically to above.
Finally we want to draw
our line indicating the current time in the signal.
We get the current time using the toc command,
and we can plot a horizontal line
across all frequencies in the figure from
0 to Fs over 2 at time tm.
We do a drawnow to make MATLAB plot it
immediately. Let's execute it.
Listening to the sound with the spectrogram,
we can see the spectrogram contains lots of
useful information about
how the signal frequency content changes over time.
We can appreciate the sharp broad spectrum energy in
the signal created by
a quick strum of the guitar strings.
We can see how the strength of
the strum signal tapers off over time as
the guitarist holds the note with
the high frequencies tapering off more quickly.
The shape of the spectrum changes as
different individual strings are plucked.
To summarize, frequency analysis is
an extremely powerful way to
analyze the frequency content,
and manipulate a wide variety of signals.
We focused here on sound signals
as they are easy to plot and listen to.
But these same analysis methods are widely applicable.
For example, the same tools are used for
analyzing the radio spectrum in radio astronomy,
or more generally any type of data that is time-varying. 