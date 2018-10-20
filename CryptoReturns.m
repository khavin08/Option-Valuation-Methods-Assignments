formatIn = 'dd-mm-yyyy'; %Specifies format of date
startDateString = '20-02-2017'; %Start date
endDateString = '20-02-2018'; %End date
startDate = datenum(startDateString, formatIn); %Converts date to matlab-readable date
endDate = datenum(endDateString, formatIn); %idem


flip = flipud(rippleprice); %table is initially set from now to past
%flip upside down to have idx(1) = oldest date idx(end) = newest date

dailyPriceOpen = flip.Open(1297:end,:); %using open prices to plot the 
%price path of XRP

%Sum of square returns
divisor = dailyPriceOpen(1:end-1,:);
SquareReturn = (diff(dailyPriceOpen,1,1)./divisor).^2;
SumOfSquares = cumsum(SquareReturn);

%plotting
subplot(2,1,1)
xDate = linspace(startDate,endDate,366); %range for x axis in days
plot(xDate,dailyPriceOpen)
xlabel('date')
ylabel('Price')
title('Asset path of XRP for open prices for 1 year')
datetick('x','mm-yyyy'); % years on x-axis
subplot(2,1,2)
plot(xDate(1:end-1),SumOfSquares)
title('Sum of square returns for XRP for 1 year')
datetick('x','mm-yyyy');
xlabel('date')
ylabel('Sum of square returns')
