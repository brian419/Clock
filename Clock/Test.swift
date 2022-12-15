struct ClockView2: View {
    // State variable to track the current time
    @State private var currentTime = Date()
    
    // State variable to track the list of alarms
    @State private var alarms: [Alarm] = []
    
    var body: some View {
        VStack {
            // Display the current time
            Text("\(currentTime, formatter: dateFormatter)")
                .font(.largeTitle)
            
            // Add a button to add new alarms
            Button(action: {
                // Show an alert to allow the user to set the time of the new alarm
                self.showAddAlarmAlert()
            }) {
                Text("Add Alarm")
            }
            
            // Display a vertical list of alarms
            List(alarms) { alarm in
                // For each alarm, show its time and a toggle to enable / disable it
                HStack {
                    Text("\(alarm.time, formatter: dateFormatter)")
                    Spacer()
                    Toggle(isOn: alarm.$enabled) {
                        // Show an empty text label to align the toggle with the rest of the row
                        Text("")
                    }
                }
            }
        }
        // Start a timer to update the current time every second
        .onAppear(perform: startTimer)
    }
    
    // A DateFormatter instance to format the date and time
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .none
        return formatter
    }()
    
    // A Timer instance to update the current time
    var timer: Timer?
    
    // Start the timer to update the current time every second
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.currentTime = Date()
            
            // Check if any of the alarms should be triggered
            for alarm in self.alarms {
                if alarm.enabled && Calendar.current.isDate(self.currentTime, inSameDayAs: alarm.time) && self.currentTime >= alarm.time {
                    // Show an alert to notify the user that the alarm has been triggered
                    self.showAlarmTriggeredAlert(alarm: alarm)
                }
            }
        }
    }
    
    // Show an alert to allow the user to set the time of a new alarm
    func showAddAlarmAlert() {
        let datePicker = DatePicker(selection: .constant(Date()), displayedComponents: .hourAndMinute) { date in
            // Add the new alarm to the list of alarms
            self.alarms.append(Alarm(time: date))
        }
        
        let alert = Alert(title: Text("Add Alarm"), message: nil, primaryButton: .default(Text("OK"), action: {
            // Save the new alarm
            self.saveAlarms()
        }), secondaryButton: .cancel())
        
        UIApplication.shared.windows.first?.rootViewController?.present(alert.withContent(datePicker), animated: true)
    }
    
    // Show an alert to notify the user that an alarm
}
