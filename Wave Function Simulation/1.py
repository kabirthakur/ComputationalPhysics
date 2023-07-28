# Import necessary libraries
import numpy as np
import matplotlib.animation as animation
import matplotlib.pyplot as plt

# Define constants
domain = 1000
m = 1.0
hbar = 1.0
dx = 1.0
V0 = 1.0e-2
thickness = 50
sigma = 50.0
x0 = round(domain/2) - 5*sigma
k0 = np.pi/20
dt = 0.49
const1 = hbar*dt/(m*dx**2)
const2 = 2*dt/hbar

# Define functions for different potentials
def Gaussian(x, t, sigma):
    return np.exp(-(x-t)**2/(2*sigma**2))

def multi_barrier(xpoints, v0, positions, thicknesses):
    pot = free(xpoints)
    for pos, thick in zip(positions, thicknesses):
        pot[int(pos):int(pos+thick)] = v0
    return pot

def free(xpoints):
    return np.zeros(xpoints)

def step(xpoints, v0):
    pot = free(xpoints)
    pot[xpoints//2:] = v0
    return pot

def barrier(xpoints, v0, thickness):
    pot = free(xpoints)
    pot[int(xpoints/2):int(xpoints/2+thickness)] = v0
    return pot

# Initialize potential and wavefunction arrays
#V = barrier(domain, V0, thickness)
V = multi_barrier(domain, V0, [domain/2, 3*domain/4], [thickness, thickness])

const2V = const2*V
psi_past_real = np.zeros(domain)
psi_past_imaginary = np.zeros(domain)
psi_present_real = np.zeros(domain)
psi_present_imaginary = np.zeros(domain)
psi_future_real = np.zeros(domain)
psi_future_imaginary = np.zeros(domain)
psi_probability = np.zeros(domain)

# Initialize wavefunction
xn = np.array(range(1, domain//2))  # Convert range to numpy array
x = np.linspace(0, domain, domain)
x_n = x[xn]  # Select only the elements in the xn range
gg = Gaussian(x_n, x0, sigma)
cosx = np.cos(k0*x_n)
sinx = np.sin(k0*x_n)

psi_present_real[xn] = cosx*gg
psi_present_imaginary[xn] = sinx*gg
psi_past_real[xn] = cosx*gg
psi_past_imaginary[xn] = sinx*gg

# Normalize wavefunction
psi_probability = psi_present_real**2 + psi_present_imaginary**2
Probability = dx * psi_probability.sum()
nrm = np.sqrt(Probability)
psi_past_real /= nrm
psi_present_real /= nrm
psi_future_real /= nrm
psi_past_imaginary /= nrm
psi_present_imaginary /= nrm
psi_future_imaginary /= nrm
psi_probability /= Probability

# Set up plot
fig, ax = plt.subplots()
xmin = 0
xmax = domain
ymax = 1.5*(psi_present_real).max()
ax.set_xlim(xmin, xmax)
ax.set_ylim(-ymax, ymax)
lineR, = ax.plot(x, psi_present_real, 'b', label='Real')
lineI, = ax.plot(x, psi_present_imaginary, 'r', label='Imaginary')
lineP, = ax.plot(x, 6*psi_probability, 'k', label='Probability')
Vmax = V.max() 
if Vmax !=0 :
    scale = ymax/(2.0*Vmax) #scaling the barrier size so it's visible
    V_plot = V*scale
    ax.plot(x,V_plot)   # Drawing Potential.
ax.legend(loc='lower left')

# Define animation function
def animate(i):
    global psi_past_real, psi_past_imaginary, psi_present_real, psi_present_imaginary, psi_future_real, psi_future_imaginary, psi_probability
    num1 = range(1, domain-1)
    num2 = range(2, domain)
    num3 = range(0, domain-2)
    psi_future_imaginary[num1] = psi_past_imaginary[num1] + const1*(psi_present_real[num2] - 2*psi_present_real[num1] + psi_present_real[num3]) - const2V[num1]*psi_present_real[num1]
    psi_future_real[num1] = psi_past_real[num1] - const1*(psi_present_imaginary[num2] - 2*psi_present_imaginary[num1] + psi_present_imaginary[num3]) + const2V[num1]*psi_present_imaginary[num1]
    psi_past_real, psi_present_real = psi_present_real, psi_future_real
    psi_past_imaginary, psi_present_imaginary = psi_present_imaginary, psi_future_imaginary
    psi_probability = psi_present_real**2 + psi_present_imaginary**2
    lineR.set_ydata(psi_present_real)
    lineI.set_ydata(psi_present_imaginary)
    lineP.set_ydata(6*psi_probability)
    leftintegral = psi_probability[:domain//2].sum()
    rightintegral = 1 - leftintegral
    print(leftintegral*100, rightintegral*100)

# Run animation
ani = animation.FuncAnimation(fig, animate, frames=1000, interval=1)
# Explicitly set the writer to ffmpeg
Writer = animation.writers['ffmpeg']
writer = Writer(fps=15, metadata=dict(artist='Me'), bitrate=1800)

# Save animation as a video file
ani.save('animation.mp4', writer=writer)

plt.show()

plt.show()
