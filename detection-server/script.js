const video = document.getElementById("video");

Promise.all([
  faceapi.nets.tinyFaceDetector.loadFromUri("/models"),
  faceapi.nets.faceLandmark68Net.loadFromUri("/models"),
]).then(startWebcam);

function startWebcam() {
    console.log("getting webcam");
  navigator.mediaDevices
    .getUserMedia({
      video: true,
      audio: false,
    })
    .then((stream) => {
      video.srcObject = stream;
    })
    .catch((error) => {
      console.error(error);
    });
}

video.addEventListener("play", () => {
  console.log("started");
  const canvas = faceapi.createCanvasFromMedia(video);
  document.body.append(canvas);
  faceapi.matchDimensions(canvas, { height: video.height, width: video.width });
    const socket = new WebSocket("ws://127.0.0.1:65001");
    socket.onopen = (_event) => {
  const ticker = setInterval(async () => {
    const detections = await faceapi
      .detectSingleFace(video, new faceapi.TinyFaceDetectorOptions())
      .withFaceLandmarks();

    const resizedDetections = faceapi.resizeResults(detections, {
      height: video.height,
      width: video.width,
    });
    canvas.getContext("2d").clearRect(0, 0, canvas.width, canvas.height);
    faceapi.draw.drawDetections(canvas, resizedDetections);
    faceapi.draw.drawFaceLandmarks(canvas, resizedDetections);

    const normalisedDetections = faceapi.resizeResults(detections,{
        height: 1.0,
        width: 1.0,
    });
    let array_out = new Float32Array(68 * 2);
    let poses = normalisedDetections.landmarks._positions;
    for (let i = 0;i < 68 * 2;i += 2){
        let pos = poses[i/2];
        array_out[i] = pos._x;
        array_out[i + 1] = pos._y;
    }
    socket.send(array_out);
  }, 15);
   
    
    socket.addEventListener("message",(_event)=>{
        socket.close();
        clearInterval(ticker);
    }); 
    };
});
