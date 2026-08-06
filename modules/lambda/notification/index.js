exports.handler = async (event) => {
  console.log("=================================");
  console.log("StockPilot Notification Lambda");
  console.log("=================================");
  console.log("Received Event:");
  console.log(JSON.stringify(event, null, 2));
  return {
    statusCode: 200,
    body: JSON.stringify({
      success: true,
      message: "Notification Lambda executed successfully"
    }),
  };
};
