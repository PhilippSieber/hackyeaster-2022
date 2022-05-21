# The CTF Oracle

## Description

The application allows users to use AI models in order to predict the future CTF points of a given CTF. The application also exposes functionality to upload profile pictures.

A series of bugs (detailed in the writeup section) are leveraged in order to gain remote code execution and cat the flag file.

A hidden hint are the default values: 52 43 45 (in hex2ascii = 'RCE')

## Writeup

A solve script can be found in exploit.py (run in linux system!)

1. We notice that the /profile-picture/uuid leaks the location where profile pictures are stored (namely /tmp)
  - GET http://46.101.107.117:2206/profile-picture/d399459a-f868-4a94-a690-c1ad272b7633
  - No such file /tmp/d399459a-f868-4a94-a690-c1ad272b7633.png

2. We can retrieve our uuid either by hitting the profile endpoint and noticing what uuid is specified in the profile-picture img or by decoding our session id.

3. We can then upload malicious files as our profile picture as only the file extension of the uploaded file is checked

4. We notice there is a directory traversal on model selection. I.e. sending a request to predict results for the ctf `../../../../../../../etc/passwd` results in errors.

5. We can then upload a malicious joblib serialized model as our profile picture and load it with the path traversal vulnerability

6. This can lead to RCE.

7. At this point there are a variety of ways to exfiltrate the data. For example, one could pipe the result of the command back into their profile picture and request it from there.