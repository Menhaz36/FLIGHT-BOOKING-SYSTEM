import {createContext, useContext, useState} from 'react';
export const UserContext = createContext();
export const UserProvider = ({children}) => {
    const [numUser, setnumUser] = useState();
    const [user, setuser] = useState(null);
    const [selectedFlight, setSelectedFlight] = useState(null);
    
    
    const updatenumUser = (count) => {
        setnumUser(count);
        setuser((prev) => {
            const newArr = Array.from({ length: count }, (_, i) =>
                prev && prev[i] ? prev[i] : { name: "", age: "", gender: "" }
            );
            return newArr;
        });
    };

    return (
        <UserContext.Provider value={{user, setuser, numUser, updatenumUser, selectedFlight, setSelectedFlight}}>
            {children}
        </UserContext.Provider>
    );
};

