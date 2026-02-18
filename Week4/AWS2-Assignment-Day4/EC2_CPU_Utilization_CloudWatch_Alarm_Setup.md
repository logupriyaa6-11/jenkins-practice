# Create a CPU utilisation matrix for an EC2 instance on cloudwatch, and if the CPU utilization goes above 80%, an alarm should get triggered and use SNS topic to send email to the yourself in case of an alarm state.

## Step 1:
To monitor CPU utilization, search for CloudWatch and open it
In the left side panel, select Metrics → All metrics

Navigate to:
EC2 -> Per-Instance Metrics

Select CPUUtilization for the required EC2 instance.
(Reason: CPUUtilization is a default EC2 metric that represents the percentage of CPU being used)
![Metric created]<Week4\AWS2-Assignment-Day4\cloudWatchMetrics.png>

## Step 2:
Click Create alarm after selecting the CPUUtilization metric
Alarms are required to define thresholds and trigger notifications

## Step 3:
Specify metric and conditions.
Metric:
Namespace: AWS/EC2
Metric name: CPUUtilization
InstanceId: Selected EC2 instance
Statistic: Average
(Reason: Average smooths short CPU spikes)
Period:
5 minutes
(Reason: Default EC2 monitoring interval and AWS best practice)

## Step 4: 
Configure conditions
Threshold type:
Static
(Reason: A fixed threshold is simple and predictable)
Condition:
Greater than
(Reason: Alarm should trigger when CPU exceeds the limit)

Threshold value:
80
Additional configuration:
Datapoints to alarm: 1 out of 1
(Reason: Triggers the alarm immediately after one breach)
Missing data treatment: Treat missing data as missing
(Reason: Avoids false alarms when metrics are temporarily unavailable)

## Step 5:
Configure actions
Alarm state trigger:
In alarm
(Reason: Notification is required only when CPU crosses the threshold)
Notification:
Send notification to SNS topic
(Reason: CloudWatch uses SNS to deliver alerts)
SNS topic:
Select existing topic

## Step 6:
Create SNS Topic
Topic type:
Standard
(Reason: Supports email notifications and does not require ordering)
Access policy:
Basic
(Reason: No custom or cross-account permissions are needed)
![topic created]<Week4\AWS2-Assignment-Day4\createdTopic&verifiedSubscription.png>

## Step 7:
Create SNS Subscription.
Protocol:
Email

Endpoint:
User email address
(Reason: Destination for alarm notifications)
Confirm subscription through email.
(Reason: SNS does not deliver messages until subscription is confirmed)
![Email verification]<Week4\AWS2-Assignment-Day4\emailVerificationForSubscription.png>

## Step 8:
Add alarm details
Alarm name:EC2-CPUUtilization-Above-80

## Step 9:
Create the alarm.
Initial alarm state:
Insufficient data
(Reason: CloudWatch requires at least one evaluation period to assess the metric)

After evaluation:
OK if CPU < 80%
ALARM if CPU > 80%
![Alarm notification to email]<Week4\AWS2-Assignment-Day4\emailAlertForCrossingThreshold.png>