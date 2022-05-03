import { useState, useEffect } from "react";
// import { useSelector } from "react-redux";

export default function SearchBar(props) {
    const [initialSets, setInitialSets] = useState("");

    useEffect(() => {
        fetch("/sets")
            .then((res) => res.json())
            .then(({ rows }) => {
                setInitialSets(rows);
            });
    }, []);

    useEffect(() => {
        let abort;
        if (!props.searchTerm) {
            props.updateSets(initialSets);
        } else {
            console.log("searchterm inside else: ", props.searchTerm);
            fetch(`/find-sets/${props.searchTerm}`)
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
    }, [props.searchTerm]);

    return (
        <>
            <div className="searchBar">
                <input
                    type="text"
                    placeholder="Search sets here"
                    onChange={(e) => props.setSearchTerm(e.target.value)}
                />
            </div>
        </>
    );
}
