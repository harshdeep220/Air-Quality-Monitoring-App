![AIR QUALITY MONITORING SYSTEM_page-0001](https://github.com/user-attachments/assets/de96226c-f09e-40a7-b4f2-190288f6a48c)

# Air Quality Monitoring System 🌍

This project is an **IoT-based Air Quality Monitoring System** designed to measure real-time environmental conditions such as temperature, humidity, gas levels, and particulate matter (PM2.5). The system utilizes advanced sensors to collect data, which is then stored, analyzed, and visualized using the **ThingSpeak** platform and a mobile app interface. The goal is to enhance awareness of air pollution and enable proactive solutions.

---

## 📝 About the Project

The Air Quality Monitoring System addresses the growing need for monitoring air pollution and environmental conditions. By leveraging IoT technology, the project provides accurate and real-time data about air quality parameters. The system is scalable, customizable, and suitable for both indoor and outdoor environments, making it ideal for smart city applications, research, and personal use.

---

## ✨ Features

- **Real-Time Monitoring**: Tracks air quality parameters live.
- **Cloud Integration**: Sensor data is stored and visualized on the ThingSpeak platform.
- **Mobile App Access**: User-friendly interface for accessing real-time data.
- **Comprehensive Analysis**: Provides temperature, humidity, gas levels, and PM2.5 data.
- **Customizable**: Compatible with additional sensors for extended functionality.
- **Scalable Design**: Suitable for indoor and outdoor applications.

---

## 🛠️ Tech Stacks

- **Microcontroller**: ESP32 with Wi-Fi and Bluetooth capabilities
- **Sensors**:
  - **BMP280**: Temperature and pressure sensor
  - **DHT22**: Digital temperature and humidity sensor
  - **GP2Y1010AU0F**: Optical dust sensor (PM2.5)
  - **MQ135**: Gas sensor for detecting pollutants like CO₂ and NH₃
- **Cloud Platform**: ThingSpeak for data storage and visualization
- **Programming Languages**: C++, Python, and Dart (for app integration)
- **Mobile App Framework**: Flutter

---

## 🔌 Circuit Connections

Here are the connections for each sensor:

1. **BMP280 Sensor**:
   - VCC → 3.3V
   - GND → GND
   - SCL → GPIO22
   - SDA → GPIO21

2. **DHT22 Sensor**:
   - VCC → 3.3V
   - GND → GND
   - Data → GPIO4

3. **GP2Y1010AU0F Sensor**:
   - VCC → 5V
   - GND → GND
   - Vo → Analog input (A0)
   - LED → GPIO2

4. **MQ135 Sensor**:
   - VCC → 5V
   - GND → GND
   - AOUT → Analog input (A1)

5. **ESP32 Microcontroller**:
   - Powers the sensors and sends data to the ThingSpeak platform.

Refer to the project's circuit diagram for detailed connections.

---

## 🚀 How to Run This Project

1. **Hardware Setup**:
   - Connect all sensors to the ESP32 as described above.
   - Ensure proper power supply to the microcontroller and sensors.

2. **ThingSpeak Setup**:
   - Create an account on [ThingSpeak](https://thingspeak.com).
   - Set up a new channel and copy the API keys.

3. **Code Deployment**:
   - Clone this repository.
   - Update the code with your Wi-Fi credentials and ThingSpeak API key.
   - Upload the code to the ESP32 using the Arduino IDE.

4. **Mobile App**:
   - Install the Flutter app (link provided in the repository).
   - Open the app to view real-time air quality data.

5. **Visualization**:
   - Log in to ThingSpeak to view live data graphs.

---

## 📈 Future Enhancements

- **Prediction Algorithms**: Implementing AI models for forecasting air quality trends.
- **Extended Sensor Integration**: Adding more sensors for ozone and noise pollution monitoring.
- **Web App**: Developing a web-based dashboard for enhanced accessibility.

---

## 🖼️ Project Showcase

- **Circuit Diagram**: [Add link or image here]
- **ThingSpeak Visualization**: [Add link or screenshot here]
- **Mobile App**: [Add link or screenshots here]

---

## 📜 License

This project is licensed under the MIT License. See the `LICENSE` file for details.

---

## 🤝 Contributions

Contributions are welcome! Please open an issue or submit a pull request.

---

## 📧 Contact

For any inquiries or feedback, please reach out to **[Your Name]** at **[Your Email Address]**.
