

//import ReactPlayer from 'react-player';
 import React from 'react';
//import Box from '@mui/material/Box';
//import React, { useState, useEffect } from 'react';
//import Box from '@mui/material/Box';
//import Slide from '@mui/material/Slide';
//import Fade from '@mui/material/Fade';
//import Typography from '@mui/material/Typography';
//import { Temporal } from 'temporal-polyfill'
//import { SequenceAnimator } from 'react-sequence-animator';

import video1 from './IPLAYER_Hold_Tight_Delivery.mp4';
import Typography from '@mui/material/Typography';



const iplayerPink = '#f54997';

    function App (){ 
 //     const [userData] = useState({});
    
    return (      
            <div className='main'>


        <video src={video1}  autoPlay loop />   
        <div className='pid'></div>
        <iframe src="https://ypdjc6zbc5cnvth24lk3mm45sm0qtgps.lambda-url.eu-west-1.on.aws/History_Channel/eu-west-2" />
        <div className="sometext">
        <Typography fontSize={'4rem'} color={iplayerPink} marginLeft={5} marginTop={3}>BBC History stream</Typography> 

          <h1>Coming up next BBC History stream</h1>

          <h1> later </h1>
         </div>
      </div>
    );
  }
  export default App
  
