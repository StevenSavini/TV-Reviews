import React from 'react';

const TitleField = (props) => {
 return(
   <label>{props.label}
     <textarea
       name={props.title}
       type='text'
       onChange={props.changeHandle}
       value={props.content}
     />
   </label>
   );
 }

 export default TitleField;
