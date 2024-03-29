function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


h = sigmoid(X*theta);
% for i = 2:length(theta)
%     tt(i) = theta(i)^2;
% end
% 
% J = 1/m * (-y'*log(h) - (1 - y)' * log(1 - h)) + ((lambda/(2*m))*sum(tt));
% 
% for ic = 1:m
%     k0(ic) =((h(ic) - y(ic)));
%     for n = 2:length(theta)
%     k1(ic,n-1) = ((h(ic) - y(ic)))*X(ic,n);
%     end
% end
% grad(1) = (1/m)*sum(k0);
% grad(2:length(theta))= (1/m)*sum(k1)' + ((lambda/m)*theta(2:length(theta)));



%Vectorized Version
J = 1/m * (-y'*log(h) - (1 - y)' * log(1 - h)) + ((lambda/(2*m))*sum((theta(2:length(theta))).^2));
grad(1) = (1/m)*sum(h - y);
grad(2:length(theta)) = (1/m)*X(:,2:length(theta))'*(h - y) + ((lambda/m)*theta(2:length(theta))); 
% =============================================================

end
