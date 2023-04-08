enum Job (+=1)
{
    INVALID_JOB_ID,
    UNEMPLOYED_JOB_ID = 1,
    TAXI_JOB_ID
}

GetJobName(Job:id, bool:capitalize = false)
{
    new jobName[32];
    switch(id)
    {
        case TAXI_JOB_ID:
            jobName = "taxista";
        default:
          jobName = "desempregado";
    }
    if(capitalize)
        jobName[0] = toupper(jobName[0]);
    return jobName;
}