import { useState, useEffect } from "react";
// import { useSelector } from "react-redux";

export default function SearchBar(props) {
    const [initialSets, setInitialSets] = useState("");
    const [searchTerm, setSearchTerm] = useState("");

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
            console.log("searchterm inside else: ", searchTerm);
            fetch(`/find-sets/${searchTerm}`)
                .then((res) => res.json())
                .then(({ rows }) => {
                    console.log(
                        "rows when we get back info from fetch: ",
                        rows
                    );
                    if (!abort) {
                        props.updateSets(rows);
                    }
                });
            return () => (abort = true);
        }
    }, [searchTerm]);

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
