function getFeaturePath(caso){
    let tag = "@" + caso.replaceAll(" ", "_");
    return "RestfulBookingWorkflow.feature" + tag;
}