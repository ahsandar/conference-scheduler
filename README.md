- Ruby `2.5.1`

**To Execute**

*via `CLI`*
- Make sure you have Ruby `2.5.1`
- RubyGems

Run commands in following order
1. Install `bundler` gems
> gem install bundle

2. Run `bundler`
> bundle

3. To run program
> ruby conf_scheduler.rb

4. To run tests
> rspec spec

*via `Docker`*

 - Make sure you have `docker`

 1. Build docker image
 > docker-compose build

 2. To run program
 > docker-compose run app ruby conf_scheduler.rb

 3. To run tests
 > docker-compose run rspec spec

 To change input file add file to `input` *folder* and update the *filename* in `conf_scheduler.rb`. You will need to rebuild `docker` image when you update the input file and name.

 There are 2 input files in the project
 1. `talks.json`
 2. `talks-1.json`

```

 Conference (conference.rb)
   └── Day (day.rb)
      └── Track (track.rb)
         ├── KEYNOTE
         │   └── talk (talk.rb)
         ├── Session (session.rb)
         │   └── talk(s)
         ├── LUNCH
         ├── Session
         │   └── talk(s)
         ├── TEA
         ├── Session
         │   └── talk(s)
         └── CLOSING

```

The Conference scheduler is designed as a tree, With a `Conference` spread over `Days` with each day having `KEYNOTE`, `LUNCH`, `TEA`, `CLOSING` and `talks` divided up in `TRACKS` for each day with each  track having `Session(s)`.

Currently the `Sorter (sorter.rb)` manages the distribution of talks over the confernce period. Currently it divides talks equally over the number of days to have balanced days. If the talk time per day is more than the total available time in sessions additional tracks are added to schedule the talks. Below is output for the sample files for reference.

 `Input` : *talks.json*

 `Output` :

 ```
 Day 1 Track 1
09:00 Design secure CD pipelines using YAN CI KEYNOTE
09:30: What exactly is meltdown? WORKSHOP
10:30: Writing a simple classifier WORKSHOP
11:30: Continuous Deployment in the era of microservices WOR
12:30 LUNCH
13:30: Rise of Cloud REGULAR_TALK
14:00: What is Map-Reduce REGULAR_TALK
14:30: Security Policies in the enterprise REGULAR_TALK
15:00 TEA
15:15: What is a container orchestration? REGULAR_TALK
15:45: Make Data Centers Secure Again REGULAR_TALK
16:15: Defensive programming REGULAR_TALK
16:25: Blockchain in 10 minutes LIGHTNING
17:00 Customer feedback for ECloud CLOSING
Day 1 Track 2
09:00 Design secure CD pipelines using YAN CI KEYNOTE
09:30: How to Solder LIGHTNING
09:40: Blue Green Deploy LIGHTNING
12:30 LUNCH
15:00 TEA
17:00 Customer feedback for ECloud CLOSING
Day 2 Track 1
09:00 Chatbot assistant to assist your helpdesk KEYNOTE
09:30: How to make a bad cocktail with a single voice comman
10:30: Secure Your Hypervisor WORKSHOP
11:30: Replicate Databases across AZs WORKSHOP
12:30 LUNCH
13:30: What Do CDNs really do? REGULAR_TALK
14:00: Testing in the Age of MVP REGULAR_TALK
14:30: What is conversational Web REGULAR_TALK
15:00 TEA
15:15: What is a container? REGULAR_TALK
15:45: Blockchain in the enterprise REGULAR_TALK
15:55: 10 command-line shortcuts you must know LIGHTNING
16:05: How does WGET work LIGHTNING
17:00 Benefits of using ETraining for your employees CLOSING
```

`Input` : *talks-1.json*

`Output` :
```
Day 1 Track 1
09:00 Design secure CD pipelines using YAN CI KEYNOTE
09:30: What exactly is meltdown? WORKSHOP
10:30: Writing a simple classifier WORKSHOP
11:30: Continuous Deployment in the era of microservices WORKSHOP
12:30 LUNCH
13:30: How to make a bad cocktail with a single voice command WORKSHOP
15:00 TEA
15:15: Secure Your Hypervisor WORKSHOP
17:00 Customer feedback for ECloud CLOSING
Day 1 Track 2
09:00 Design secure CD pipelines using YAN CI KEYNOTE
09:30: What exactly is meltdown? - III WORKSHOP
10:30: Writing a simple classifie - IIIr WORKSHOP
11:30: Continuous Deployment in the era of microservices - III WORKSHOP
12:30 LUNCH
13:30: Rise of Cloud REGULAR_TALK
14:00: What is Map-Reduce REGULAR_TALK
14:30: Security Policies in the enterprise REGULAR_TALK
15:00 TEA
15:15: What is a container orchestration? REGULAR_TALK
15:45: Make Data Centers Secure Again REGULAR_TALK
16:15: Defensive programming REGULAR_TALK
17:00 Customer feedback for ECloud CLOSING
Day 1 Track 3
09:00 Design secure CD pipelines using YAN CI KEYNOTE
09:30: What Do CDNs really do? REGULAR_TALK
10:00: Testing in the Age of MVP REGULAR_TALK
10:30: What is conversational Web REGULAR_TALK
11:00: What is a container? REGULAR_TALK
11:30: Blockchain in the enterprise REGULAR_TALK
12:00: Rise of Cloud - III REGULAR_TALK
12:30 LUNCH
13:30: What is Map-Reduce - III REGULAR_TALK
14:00: Security Policies in the enterprise - III REGULAR_TALK
14:30: What is a container orchestration? - III REGULAR_TALK
15:00 TEA
15:15: Make Data Centers Secure Again - III REGULAR_TALK
15:45: Defensive programming - III REGULAR_TALK
15:55: Blockchain in 10 minutes LIGHTNING
16:05: How to Solder LIGHTNING
16:15: Blue Green Deploy LIGHTNING
16:25: 10 command-line shortcuts you must know LIGHTNING
17:00 Customer feedback for ECloud CLOSING
Day 1 Track 4
09:00 Design secure CD pipelines using YAN CI KEYNOTE
09:30: How does WGET work LIGHTNING
09:40: Blockchain in 10 minutes - III LIGHTNING
09:50: How to Solder - III LIGHTNING
10:00: Blue Green Deploy - III LIGHTNING
12:30 LUNCH
15:00 TEA
17:00 Customer feedback for ECloud CLOSING
Day 2 Track 1
09:00 Chatbot assistant to assist your helpdesk - III KEYNOTE
09:30: How to make a bad cocktail with a single voice command - III WORKSHOP
10:30: Secure Your Hypervisor - III WORKSHOP
11:30: Replicate Databases across AZs - II WORKSHOP
12:30 LUNCH
13:30: What exactly is meltdown? - II WORKSHOP
15:00 TEA
15:15: Writing a simple classifier - II WORKSHOP
17:00 Benefits of using ETraining for your employees - III CLOSING
Day 2 Track 2
09:00 Chatbot assistant to assist your helpdesk - III KEYNOTE
09:30: How to make a bad cocktail with a single voice command - II WORKSHOP
10:30: Secure Your Hypervisor - II WORKSHOP
11:30: Replicate Databases across AZs - II WORKSHOP
12:30 LUNCH
13:30: What Do CDNs really do? - III REGULAR_TALK
14:00: Testing in the Age of MVP - III REGULAR_TALK
14:30: What is conversational Web - III REGULAR_TALK
15:00 TEA
15:15: What is a container? - III REGULAR_TALK
15:45: Blockchain in the enterprise - III REGULAR_TALK
16:15: Rise of Cloud - II REGULAR_TALK
17:00 Benefits of using ETraining for your employees - III CLOSING
Day 2 Track 3
09:00 Chatbot assistant to assist your helpdesk - III KEYNOTE
09:30: What is Map-Reduce - II REGULAR_TALK
10:00: Security Policies in the enterprise - II REGULAR_TALK
10:30: What is a container orchestration? - II REGULAR_TALK
11:00: Make Data Centers Secure Again - II REGULAR_TALK
11:30: Defensive programming - II REGULAR_TALK
12:00: What Do CDNs really do? - II REGULAR_TALK
12:30 LUNCH
13:30: Testing in the Age of MVP - II REGULAR_TALK
14:00: What is conversational Web - II REGULAR_TALK
14:30: What is a container? - II REGULAR_TALK
15:00 TEA
15:15: Blockchain in the enterprise - II REGULAR_TALK
15:25: 10 command-line shortcuts you must know - III LIGHTNING
15:35: How does WGET work - III LIGHTNING
15:45: Blockchain in 10 minutes - II LIGHTNING
15:55: How to Solder - II LIGHTNING
16:06: Blue Green Deploy - II LIGHTNING
16:16: 10 command-line shortcuts you must know - II LIGHTNING
16:26: How does WGET work - II LIGHTNING
17:00 Benefits of using ETraining for your employees - III CLOSING
```
