#!/usr/bin/env python

# Cox-Ross-Rubinstein Binomial model
# Copyright (c) Dale Roberts 2009 <dale.o.roberts@gmail.com>

from numpy import array, zeros, arange

def put_payoff(S, K):
	return max(K-S, 0)
	
def call_payoff(S, K):
	return max(S-K, 0)	

def euro_tree(S, K, u, d, r, N=1, payoff=put_payoff):
	
	# 1 step is 2 values, so N+1 length
	V = zeros(N+1, 'd')
	
	# Initialise value for time T
	for i in arange(0, N+1):
		St = S * u ** i * d ** (N-i)
		V[i] = payoff(St,K)
	#print V
	
	rhat = (1 + r)
	pstar = (rhat - d) / (u - d)
	
	# work backwards
	for ts in arange(N, 0, -1):
		for i in arange(0, ts):
			V[i] = (pstar * V[i+1] + (1-pstar) * V[i]) / rhat	
		#print V
	
	return V[0]
	
def amer_tree(S, K, u, d, r, N=1, payoff=put_payoff):
	
	# 1 step is 2 values, so N+1 length
	V = zeros(N+1, 'd')
	
	# Initialise value for time T
	for i in arange(0, N+1):
		St = S * u ** i * d ** (N-i)
		V[i] = payoff(St,K)
	print V
	
	rhat = (1 + r)
	pstar = (rhat - d) / (u - d)
	
	# work backwards
	for ts in arange(N, 0, -1):
		print "-"*4
		for i in arange(0, ts):
			St = S * u ** (i+1) * d ** (N-i-1)
			Vt = (pstar * V[i+1] + (1-pstar) * V[i]) / rhat
			Pt = payoff(St,K)
			
			V[i] = max(Pt,Vt)
			print i, St, Pt, Vt, V[i]
		#print V
	
	return V[0]
	

def test_euro():
	assert (euro_tree(4.0, 5.0, 2.0, 0.5, 0.25, 3, put_payoff) - 0.864) < 0.0001
	assert (euro_tree(4.0, 5.0, 2.0, 0.5, 0.25, 3, call_payoff) - 2.304) < 0.0001
	
def test_amer():
	print amer_tree(4.0, 5.0, 2.0, 0.5, 0.25, 2, put_payoff)
		
if __name__ == '__main__':
	test_euro()
	test_amer()
	
