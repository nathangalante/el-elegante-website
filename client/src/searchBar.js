import { useState } from "react";
// import { useSelector } from "react-redux";

export default function SearchBar(props) {
    console.log("props:????", props);
    const [searchInput, setSearchInput] = useState("");

    const handleChange = (e) => {
        setSearchInput(e.target.value);
        console.log("search input", searchInput);

        if (searchInput.length > 0) {
            let newSet = [];

            for (let i = 0; i < props.sets.length; i++) {
                if (
                    props.sets[i].name.toLowerCase().indexOf(e.target.value) >
                    -1
                ) {
                    // console.log("whole info: ", props.sets[i]);
                    // console.log("each item inside sets: ", props.sets[i].name);
                    newSet.push(props.sets[i]);
                }
            }
            console.log("new set looks like??? ", newSet);
            props.updateSets(newSet);
        }
    };

    return (
        <>
            <input
                className="searchBar"
                type="text"
                placeholder="Search here"
                onChange={handleChange}
                value={searchInput}
            />
        </>
    );
}
