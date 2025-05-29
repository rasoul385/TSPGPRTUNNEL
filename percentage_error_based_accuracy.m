
predicted =Ees3
actual=Ets'
errors = abs(predicted - actual);
mean_error_percent = mean(errors ./ actual) * 100;
accuracy = 100 - mean_error_percent;
disp(['Accuracy (%): ', num2str(accuracy)]);