export default function AllSets(props) {
    return (
        <>
            <div className="setsHome">
                {props.sets &&
                    props.sets.map((set) => (
                        <div key={set.id}>
                            <div
                                className="setHome"
                                onClick={() =>
                                    props.updateSelectedState(set.id)
                                }
                            >
                                <img
                                    src={"/rosa7.png"}
                                    height={180}
                                    width={190}
                                />
                                <p>{set.name}</p>
                            </div>
                        </div>
                    ))}
            </div>
        </>
    );
}
