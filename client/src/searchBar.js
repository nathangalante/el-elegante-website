import { useState, useEffect } from "react";
// import { useSelector } from "react-redux";

export default function SearchBar(props) {
    const [initialSets, setInitialSets] = useState("");
    const [searchTerm, setSearchTerm] = useState("");
    const [sets, setSets] = useState("");

    useEffect(() => {
        fetch("/sets")
            .then((res) => res.json())
            .then(({ rows }) => {
                setInitialSets(rows);
            });
    }, []);

    useEffect(() => {
        let abort;
        if (!searchTerm) {
            props.updateSets(initialSets);
        } else {
            fetch(`/find-sets/${searchTerm}`)
                .then((res) => res.json())
                .then(({ rows }) => {
                    if (!abort) {
                        setSets(rows);
                        props.updateSets(sets);
                    }
                });
            return () => (abort = true);
        }
    }, [searchTerm]);

    // const handleChange = (e) => {
    //     setSearchInput(e.target.value);
    //     console.log("search input", searchInput);

    //     if (searchInput.length > 0) {
    //         let newSet = [];

    //         for (let i = 0; i < props.sets.length; i++) {
    //             if (
    //                 props.sets[i].name.toLowerCase().indexOf(e.target.value) >
    //                 -1
    //             ) {
    //                 // console.log("whole info: ", props.sets[i]);
    //                 // console.log("each item inside sets: ", props.sets[i].name);
    //                 newSet.push(props.sets[i]);
    //             }
    //         }
    //         console.log("new set looks like??? ", newSet);
    //         props.updateSets(newSet);
    //     }
    // };

    return (
        <>
            <input
                className="searchBar"
                type="text"
                placeholder="Search here"
                onChange={(e) => setSearchTerm(e.target.value)}
            />
        </>
    );
}
