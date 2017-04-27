import React from 'react';

const DescriptionField = (props) => {
 return(
   <label>{props.label}
     <textarea
       name={props.description}
       type='text'
       onChange={props.changeHandle}
       value={props.content}
     />
   </label>
   );
 }

 export default DescriptionField;
